echo "Warning: Please use this script with care as it updates
the kernel and may cause issues with your device."

echo "Are you sure you want to continue? (y/n)"
read -r response
if [ "$response" != "y" ]; then
  echo "Exiting..."
  exit 1
fi


grubby --args=apple_dcp.show_notch=1 --update-kernel=ALL