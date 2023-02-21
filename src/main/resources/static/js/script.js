/**
 * 
 */
console.log("HELLO THERE PARDNER SCRIPT.JS IS RUNNIN REAL CLEAN-LIKE!")
function copyFunction() {
  // Get the text field
  let copyText = document.getElementById("dumpsterLink");

  // Select the text field
  copyText.select();
  copyText.setSelectionRange(0, 99999); // For mobile devices

   // Copy the text inside the text field
  navigator.clipboard.writeText(copyText.value);

  // Alert the copied text
  console.log("Copied the text: " + copyText.value);
}