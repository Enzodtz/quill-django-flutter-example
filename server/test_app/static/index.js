function HTMLencode(str) {
  // str = str.replace(/[\u00A0-\u9999<>\&]/g, function (i) {
  //   return "&#" + i.charCodeAt(0) + ";";
  // });
  str = str.replaceAll('"', "&quot");
  return str;
}

var quill = new Quill("#editor", {
  theme: "snow",
});

var form = document.querySelector("#form");
form.onsubmit = function (e) {
  quillJSON = quill.getContents();
  quillJSON = JSON.stringify(quillJSON);
  quillJSON = HTMLencode(quillJSON);

  quillHTML = quill.root.innerHTML;
  quillHTML = HTMLencode(quillHTML);

  form.innerHTML += `
    <input type="hidden" value="${quillJSON}" name="quillJSON">
  `;
  form.innerHTML += `
    <input type="hidden" value="${quillHTML}" name="quillHTML">
  `;
};
