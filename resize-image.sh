#!/bin/bash
set -euo pipefail

# Default dimensions
DEFAULT_WIDTH=450
DEFAULT_HEIGHT=250

# Help function
show_help() {
    echo "Usage: $0 <input_image> [width] [height] [output_image]"
    echo ""
    echo "Resize a transparent image to specified dimensions"
    echo ""
    echo "Arguments:"
    echo "  input_image   Path to the input image file"
    echo "  width         Output width (default: $DEFAULT_WIDTH)"
    echo "  height        Output height (default: $DEFAULT_HEIGHT)"
    echo "  output_image  Output file path (default: resized_<input_filename>)"
    echo ""
    echo "Examples:"
    echo "  $0 image.png                    # Resize to 450x250"
    echo "  $0 image.png 600 400           # Resize to 600x400"
    echo "  $0 image.png 600 400 output.png # Resize to 600x400, save as output.png"
    echo ""
    echo "Uses macOS built-in sips command (no external packages required)"
}

# Check if sips is available (macOS built-in)
if ! command -v sips &> /dev/null; then
    echo "❌ Error: sips command not found."
    echo "   This script requires macOS (sips is built-in on macOS)"
    echo "   For other platforms, consider using ImageMagick version."
    exit 1
fi

# Check arguments
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    show_help
    exit 0
fi

# Input validation
INPUT_IMAGE="$1"
if [ ! -f "$INPUT_IMAGE" ]; then
    echo "❌ Error: Input image '$INPUT_IMAGE' does not exist."
    exit 1
fi

# Get dimensions
WIDTH=${2:-$DEFAULT_WIDTH}
HEIGHT=${3:-$DEFAULT_HEIGHT}

# Validate dimensions are numbers
if ! [[ "$WIDTH" =~ ^[0-9]+$ ]] || ! [[ "$HEIGHT" =~ ^[0-9]+$ ]]; then
    echo "❌ Error: Width and height must be positive integers."
    exit 1
fi

# Generate output filename if not provided
if [ $# -ge 4 ]; then
    OUTPUT_IMAGE="$4"
else
    # Extract filename without extension and directory
    BASENAME=$(basename "$INPUT_IMAGE" | sed 's/\.[^.]*$//')
    EXTENSION="${INPUT_IMAGE##*.}"
    OUTPUT_IMAGE="resized_${BASENAME}.${EXTENSION}"
fi

echo "🖼️  Resizing image..."
echo "   Input:      $INPUT_IMAGE"
echo "   Output:     $OUTPUT_IMAGE"
echo "   Dimensions: ${WIDTH}x${HEIGHT}"

# Copy the input to output first (to preserve original)
cp "$INPUT_IMAGE" "$OUTPUT_IMAGE"

# Resize the image using sips (macOS built-in tool)
# -z sets height and width
# --resampleHeightWidthMax maintains aspect ratio within bounds
sips -z "$HEIGHT" "$WIDTH" "$OUTPUT_IMAGE" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Successfully resized image to $OUTPUT_IMAGE"
    
    # Show file size info
    INPUT_SIZE=$(stat -f%z "$INPUT_IMAGE" 2>/dev/null || echo "unknown")
    OUTPUT_SIZE=$(stat -f%z "$OUTPUT_IMAGE" 2>/dev/null || echo "unknown")
    
    echo "📊 File sizes:"
    if [ "$INPUT_SIZE" != "unknown" ] && [ "$OUTPUT_SIZE" != "unknown" ]; then
        echo "   Input:  $(numfmt --to=iec "$INPUT_SIZE" 2>/dev/null || echo "$INPUT_SIZE bytes")"
        echo "   Output: $(numfmt --to=iec "$OUTPUT_SIZE" 2>/dev/null || echo "$OUTPUT_SIZE bytes")"
    else
        echo "   Input:  $INPUT_SIZE"
        echo "   Output: $OUTPUT_SIZE"
    fi
else
    echo "❌ Error: Failed to resize image."
    exit 1
fi 