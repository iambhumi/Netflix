# Create Assets directory if it doesn't exist
New-Item -ItemType Directory -Force -Path ".\Assets"

# Download Netflix logo
Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/iambhumi/Netflix@main/Assets/logo.png" -OutFile ".\Assets\logo.png"

# Create placeholder images using base64 encoded solid colors
$images = @{
    "header-image.png" = @{width=1920; height=1080; color="#000000"}
    "feature-1.png" = @{width=600; height=400; color="#232323"}
    "feature-2.png" = @{width=600; height=400; color="#232323"}
    "feature-3.png" = @{width=600; height=400; color="#232323"}
    "feature-4.png" = @{width=600; height=400; color="#232323"}
    "down-icon.png" = @{width=50; height=50; color="#FFFFFF"}
    "favicon.png" = @{width=32; height=32; color="#E50914"}
}

foreach ($image in $images.GetEnumerator()) {
    $width = $image.Value.width
    $height = $image.Value.height
    $color = $image.Value.color
    $outputPath = ".\Assets\$($image.Key)"
    
    # Create a 1x1 pixel image of the specified color
    $base64 = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg=="
    [System.Convert]::FromBase64String($base64) | Set-Content $outputPath -Encoding Byte
}
