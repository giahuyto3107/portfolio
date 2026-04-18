import 'dart:js_interop';

@JS('document')
external JSObject get document;

@JS()
extension type HTMLAnchorElement(JSObject _) implements JSObject {
  external String href;
  external String download;
  external void click();
}

void downloadCV() {
  final HTMLAnchorElement anchor =
  (document as dynamic).createElement('a') as HTMLAnchorElement;
  anchor.href = 'assets/cv.pdf';
  anchor.download = 'CV.pdf';
  anchor.click();
}