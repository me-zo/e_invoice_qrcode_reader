# E-Invoice QR Code Reader KSA Flutter Application

E-Invoice QR Reader: This application was developed with the aim of displaying the QR Code contents of any E-Invoice that is compliant with the Zakat and Tax Authority in Saudi Arabia.

## Where Did The Application Idea Come From ?
After the Zakat and Tax Authority in Saudi Arabia Enforced new rules upon E-Invoicing some of those rules indicated that every E-Invoice has to have a QR Code that is responsible for confirming the identity of the merchant and weather they are the rules or not.
One of the rules is "Compliant E-Invoices Have To Have a generated QR-Code that is Encrypted in Base64 and formatted in TLV format" when scanned Certain information have show to the customer.

## Implementation

If you're familiar with the situation you probably noticed that there is a similar app on the store [E-Invoice QR Reader KSA](https://play.google.com/store/apps/details?id=com.posbankbh.einvoiceqrreader) I Basically [Reverse Engineered](https://en.wikipedia.org/wiki/Reverse_engineering) that app and modified the UI to my liking as well as added an additional theme option supporting light and dark themes.

## Application ScreenShots

### Home Page

![Home Dark Theme](https://raw.githubusercontent.com/Mezo0099/e_invoice_qrcode_reader/master/README/images/Home.PNG)

>Note: The button has a beating animation which is why it's different

### Camera And Settings

![Camera Scanner](https://raw.githubusercontent.com/Mezo0099/e_invoice_qrcode_reader/master/README/images/settings-camera.png)

### Successful Scan

![Successful Scan](https://raw.githubusercontent.com/Mezo0099/e_invoice_qrcode_reader/master/README/images/Successful%20Scan.PNG)

### Failed Scan

![Failed Scan](https://raw.githubusercontent.com/Mezo0099/e_invoice_qrcode_reader/master/README/images/Failed%20Scan.PNG)

### History

![History](https://raw.githubusercontent.com/Mezo0099/e_invoice_qrcode_reader/master/README/images/Deleting%20History.PNG)
>Note: History is stored using a Local Database [ObjectBox](https://pub.dev/packages/objectbox) which is why I wasn't able to host the app as a website


### Frequently Asked Questions


![Faqs](https://raw.githubusercontent.com/Mezo0099/e_invoice_qrcode_reader/master/README/images/Faqs.PNG)

## The App is not available in stores Yet, Thus In Case you want to Try/Use it From [My Drive](https://drive.google.com/file/d/1xo0QSd-fOL5WgA4epOrsWRx0mz28Dk9Q/view?usp=sharing) or from download the [app-release.apk](https://github.com/Mezo0099/e_invoice_qrcode_reader/tree/master/build/app)



