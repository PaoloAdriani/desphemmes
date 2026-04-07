<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <title>${emailLabelMap.ShippingConfirmationHeadTitle}</title>

    <style type="text/css">
        body {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            font-smoothing: always;
            letter-spacing: 0.5px;
            padding: 0 40px;
            font-family: 'Montserrat', sans-serif;
        }
        p {
            margin: 10px 0;
            padding: 0;
        }
        table {
            border-collapse: collapse;
        }
        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            display: block;
            margin: 0;
            padding: 0;
        }
        img,
        a img {
            border: 0;
            height: auto;
            outline: none;
            text-decoration: none;
        }
        body,
        #bodyTable,
        #bodyCell {
            height: 100%;
            margin: 0;
            padding: 0;
            width: 100%;
        }
        #outlook a {
            padding: 0;
        }
        img {
            -ms-interpolation-mode: bicubic;
        }
        table {
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }
        .ReadMsgBody {
            width: 100%;
        }
        .ExternalClass {
            width: 100%;
        }
        p,
        a,
        li,
        td,
        blockquote {
            mso-line-height-rule: exactly;
        }
        a[href^=tel],
        a[href^=sms] {
            color: inherit;
            cursor: default;
            text-decoration: none;
        }
        p,
        a,
        li,
        td,
        body,
        table,
        blockquote {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }
        .ExternalClass,
        .ExternalClass p,
        .ExternalClass td,
        .ExternalClass div,
        .ExternalClass span,
        .ExternalClass font {
            line-height: 100%;
        }
        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }
        #bodyCell {
            padding: 10px;
        }
        .templateContainer {
            max-width: 600px !important;
            border: 0;
        }
        a.mcnButton {
            display: block;
        }
        .mcnImage {
            vertical-align: bottom;
        }
        .mcnTextContent {
            word-break: break-word;
        }
        .mcnTextContent img {
            height: auto !important;
        }
        .mcnDividerBlock {
            table-layout: fixed !important;
        }
        /*
	@tab Page
	@section Background Style
	@tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.
	*/

        body,
        #bodyTable {
            /*@editable*/

            background-color: #f7f7f7;
        }
        /*
	@tab Page
	@section Background Style
	@tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.
	*/

        #bodyCell {
            /*@editable*/

            border-top: 0;
        }
        /*
	@tab Page
	@section Email Border
	@tip Set the border for your email.
	*/

        .templateContainer {
            /*@editable*/

            border: 0;
        }
        /*
	@tab Page
	@section Heading 1
	@tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.
	@style heading 1
	*/

        h1 {
            color: #000000;
            font-family: "Montserrat", Helvetica, sans-serif;
            font-style: normal;
            font-weight: bold;
            letter-spacing: 2px;
            line-height: 125%;
            text-align: center;
            text-transform: uppercase;
            font-size: 22px;
        }
        /*
	@tab Page
	@section Heading 2
	@tip Set the styling for all second-level headings in your emails.
	@style heading 2
	*/

        h2 {
            /*@editable*/

            color: #202020;
            /*@editable*/

            font-family: Helvetica;
            /*@editable*/

            font-size: 22px;
            /*@editable*/

            font-style: normal;
            /*@editable*/

            font-weight: bold;
            /*@editable*/

            line-height: 125%;
            /*@editable*/

            letter-spacing: normal;
            /*@editable*/

            text-align: left;
        }
        /*
	@tab Page
	@section Heading 3
	@tip Set the styling for all third-level headings in your emails.
	@style heading 3
	*/

        h3 {
            /*@editable*/

            color: #202020;
            /*@editable*/

            font-family: Helvetica;
            /*@editable*/

            font-size: 20px;
            /*@editable*/

            font-style: normal;
            /*@editable*/

            font-weight: bold;
            /*@editable*/

            line-height: 125%;
            /*@editable*/

            letter-spacing: normal;
            /*@editable*/

            text-align: left;
        }
        /*
	@tab Page
	@section Heading 4
	@tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.
	@style heading 4
	*/

        h4 {
            /*@editable*/

            color: #666666;
            /*@editable*/

            font-family: Helvetica;
            /*@editable*/

            font-size: 14px;
            /*@editable*/

            font-style: normal;
            /*@editable*/

            font-weight: bold;
            /*@editable*/

            line-height: 125%;
            /*@editable*/

            letter-spacing: normal;
            /*@editable*/

            text-align: left;
        }
        /*
	@tab Preheader
	@section Preheader Style
	@tip Set the background color and borders for your email's preheader area.
	*/

        #templatePreheader {
            /*@editable*/

            background-color: #fafafa;
            /*@editable*/

            background-image: none;
            /*@editable*/

            background-repeat: no-repeat;
            /*@editable*/

            background-position: center;
            /*@editable*/

            background-size: cover;
            /*@editable*/

            border-top: 0;
            /*@editable*/

            border-bottom: 0;
            /*@editable*/

            padding-top: 9px;
            /*@editable*/

            padding-bottom: 9px;
        }
        /*
	@tab Preheader
	@section Preheader Text
	@tip Set the styling for your email's preheader text. Choose a size and color that is easy to read.
	*/

        #templatePreheader .mcnTextContent,
        #templatePreheader .mcnTextContent p {
            /*@editable*/

            color: #656565;
            /*@editable*/

            font-family: Helvetica;
            /*@editable*/

            font-size: 12px;
            /*@editable*/

            line-height: 150%;
            /*@editable*/

            text-align: left;
        }
        /*
	@tab Preheader
	@section Preheader Link
	@tip Set the styling for your email's preheader links. Choose a color that helps them stand out from your text.
	*/

        #templatePreheader .mcnTextContent a,
        #templatePreheader .mcnTextContent p a {
            /*@editable*/

            color: #656565;
            /*@editable*/

            font-weight: normal;
            /*@editable*/

            text-decoration: underline;
        }
        /*
	@tab Header
	@section Header Style
	@tip Set the background color and borders for your email's header area.
	*/

        #templateHeader {
            /*@editable*/

            background-color: #ffffff;
            /*@editable*/

            background-image: none;
            /*@editable*/

            background-repeat: no-repeat;
            /*@editable*/

            background-position: center;
            /*@editable*/

            background-size: cover;
            /*@editable*/

            border-top: 0;
            /*@editable*/

            border-bottom: 0;
            /*@editable*/

            padding-top: 9px;
            /*@editable*/

            padding-bottom: 0;
        }
        /*
	@tab Header
	@section Header Text
	@tip Set the styling for your email's header text. Choose a size and color that is easy to read.
	*/

        #templateHeader .mcnTextContent,
        #templateHeader .mcnTextContent p {
            /*@editable*/

            color: #202020;
            /*@editable*/

            font-family: Helvetica;
            /*@editable*/

            font-size: 16px;
            /*@editable*/

            line-height: 150%;
            /*@editable*/

            text-align: left;
        }
        /*
	@tab Header
	@section Header Link
	@tip Set the styling for your email's header links. Choose a color that helps them stand out from your text.
	*/

        #templateHeader .mcnTextContent a,
        #templateHeader .mcnTextContent p a {
            /*@editable*/

            color: #000000;
            /*@editable*/

            font-weight: normal;
            /*@editable*/

            text-decoration: underline;
        }
        /*
	@tab Upper Body
	@section Upper Body Style
	@tip Set the background color and borders for your email's upper body area.
	*/

        #templateUpperBody {
            /*@editable*/

            background-color: #ffffff;
            /*@editable*/

            background-image: none;
            /*@editable*/

            background-repeat: no-repeat;
            /*@editable*/

            background-position: center;
            /*@editable*/

            background-size: cover;
            /*@editable*/

            border-top: 0;
            /*@editable*/

            border-bottom: 0;
            /*@editable*/

            padding-top: 0;
            /*@editable*/

            padding-bottom: 0px;
        }
        /*
	@tab Upper Body
	@section Upper Body Text
	@tip Set the styling for your email's upper body text. Choose a size and color that is easy to read.
	*/

        #templateUpperBody .mcnTextContent,
        #templateUpperBody .mcnTextContent p {
            /*@editable*/

            color: #666666;
            /*@editable*/

            font-family: "Montserrat", Arial, sans-serif;
            /*@editable*/

            font-size: 12px;
            /*@editable*/

            line-height: 150%;
            /*@editable*/

            text-align: left;
            letter-spacing: 0.5px;
        }
        /*
	@tab Upper Body
	@section Upper Body Link
	@tip Set the styling for your email's upper body links. Choose a color that helps them stand out from your text.
	*/

        #templateUpperBody .mcnTextContent a,
        #templateUpperBody .mcnTextContent p a {
            /*@editable*/

            color: #000000;
            /*@editable*/

            font-weight: normal;
            /*@editable*/

            text-decoration: underline;
        }
        /*
	@tab Columns
	@section Column Style
	@tip Set the background color and borders for your email's columns.
	*/

        #templateColumns {
            /*@editable*/

            background-color: #ffffff;
            /*@editable*/

            background-image: none;
            /*@editable*/

            background-repeat: no-repeat;
            /*@editable*/

            background-position: center;
            /*@editable*/

            background-size: cover;
            /*@editable*/

            border-top: 0;
            /*@editable*/

            border-bottom: 0;
            /*@editable*/

            padding-top: 0;
            /*@editable*/

            padding-bottom: 0;
        }
        /*
	@tab Columns
	@section Column Text
	@tip Set the styling for your email's column text. Choose a size and color that is easy to read.
	*/

        #templateColumns .columnContainer .mcnTextContent,
        #templateColumns .columnContainer .mcnTextContent p {
            /*@editable*/

            color: #666666;
            /*@editable*/

            font-family: "Montserrat", Arial, sans-serif;
            /*@editable*/

            font-size: 12px;
            /*@editable*/

            line-height: 150%;
            /*@editable*/

            text-align: left;
        }
        /*
	@tab Columns
	@section Column Link
	@tip Set the styling for your email's column links. Choose a color that helps them stand out from your text.
	*/

        #templateColumns .columnContainer .mcnTextContent a,
        #templateColumns .columnContainer .mcnTextContent p a {
            /*@editable*/

            color: #000000;
            /*@editable*/

            font-weight: normal;
            /*@editable*/

            text-decoration: underline;
        }
        /*
	@tab Lower Body
	@section Lower Body Style
	@tip Set the background color and borders for your email's lower body area.
	*/

        #templateLowerBody {
            /*@editable*/

            background-color: #ffffff;
            /*@editable*/

            background-image: none;
            /*@editable*/

            background-repeat: no-repeat;
            /*@editable*/

            background-position: center;
            /*@editable*/

            background-size: cover;
            /*@editable*/

            border-top: 0;
            /*@editable*/

            border-bottom: 2px solid #EAEAEA;
            /*@editable*/

            padding-top: 0;
            /*@editable*/

            padding-bottom: 0px;
        }
        /*
	@tab Lower Body
	@section Lower Body Text
	@tip Set the styling for your email's lower body text. Choose a size and color that is easy to read.
	*/

        #templateLowerBody .mcnTextContent,
        #templateLowerBody .mcnTextContent p {
            /*@editable*/

            color: #666666;
            /*@editable*/

            font-family: "Montserrat", Arial, sans-serif;
            /*@editable*/

            font-size: 12px;
            /*@editable*/

            line-height: 150%;
            /*@editable*/

            text-align: left;
        }
        /*
	@tab Lower Body
	@section Lower Body Link
	@tip Set the styling for your email's lower body links. Choose a color that helps them stand out from your text.
	*/

        #templateLowerBody .mcnTextContent a,
        #templateLowerBody .mcnTextContent p a {
            /*@editable*/

            color: #000000;
            /*@editable*/

            font-weight: normal;
            /*@editable*/

            text-decoration: underline;
        }
        /*
	@tab Footer
	@section Footer Style
	@tip Set the background color and borders for your email's footer area.
	*/

        #templateFooter {
            /*@editable*/

            background-color: #000000;
            /*@editable*/

            background-image: none;
            /*@editable*/

            background-repeat: no-repeat;
            /*@editable*/

            background-position: center;
            /*@editable*/

            background-size: cover;
            /*@editable*/

            border-top: 3px solid #000;
            /*@editable*/

            border-bottom: 0;
            /*@editable*/

            padding-top: 0px;
            /*@editable*/

            padding-bottom: 9px;
        }
        /*
	@tab Footer
	@section Footer Text
	@tip Set the styling for your email's footer text. Choose a size and color that is easy to read.
	*/

        #templateFooter .mcnTextContent,
        #templateFooter .mcnTextContent p {
            /*@editable*/

            color: #666666;
            /*@editable*/

            font-family: "Montserrat", Arial, sans-serif;
            /*@editable*/

            font-size: 11px;
            /*@editable*/

            line-height: 150%;
            /*@editable*/

            text-align: center;
        }
        /*
	@tab Footer
	@section Footer Link
	@tip Set the styling for your email's footer links. Choose a color that helps them stand out from your text.
	*/

        #templateFooter .mcnTextContent a,
        #templateFooter .mcnTextContent p a {
            /*@editable*/

            color: #666666;
            /*@editable*/

            font-weight: normal;
            /*@editable*/

            text-decoration: underline;
        }
        @media only screen and (min-width: 768px) {
            .templateContainer {
                width: 600px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            body,
            table,
            td,
            p,
            a,
            li,
            blockquote {
                -webkit-text-size-adjust: none !important;
            }
        }
        @media only screen and (max-width: 480px) {
            body {
                width: 100% !important;
                min-width: 100% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            #bodyCell {
                padding-top: 10px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .columnWrapper {
                max-width: 100% !important;
                width: 100% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnImage {
                width: 100% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnCartContainer,
            .mcnCaptionTopContent,
            .mcnRecContentContainer,
            .mcnCaptionBottomContent,
            .mcnTextContentContainer,
            .mcnBoxedTextContentContainer,
            .mcnImageGroupContentContainer,
            .mcnCaptionLeftTextContentContainer,
            .mcnCaptionRightTextContentContainer,
            .mcnCaptionLeftImageContentContainer,
            .mcnCaptionRightImageContentContainer,
            .mcnImageCardLeftTextContentContainer,
            .mcnImageCardRightTextContentContainer {
                max-width: 100% !important;
                width: 100% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnBoxedTextContentContainer {
                min-width: 100% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnImageGroupContent {
                padding: 9px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnCaptionLeftContentOuter .mcnTextContent,
            .mcnCaptionRightContentOuter .mcnTextContent {
                padding-top: 9px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnImageCardTopImageContent,
            .mcnCaptionBlockInner .mcnCaptionTopContent:last-child .mcnTextContent {
                padding-top: 18px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnImageCardBottomImageContent {
                padding-bottom: 9px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnImageGroupBlockInner {
                padding-top: 0 !important;
                padding-bottom: 0 !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnImageGroupBlockOuter {
                padding-top: 9px !important;
                padding-bottom: 9px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnTextContent,
            .mcnBoxedTextContentColumn {
                padding-right: 18px !important;
                padding-left: 18px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcnImageCardLeftImageContent,
            .mcnImageCardRightImageContent {
                padding-right: 18px !important;
                padding-bottom: 0 !important;
                padding-left: 18px !important;
            }
        }
        @media only screen and (max-width: 480px) {
            .mcpreview-image-uploader {
                display: none !important;
                width: 100% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Heading 1
	@tip Make the first-level headings larger in size for better readability on small screens.
	*/

            h1 {
                /*@editable*/

                font-size: 22px !important;
                /*@editable*/

                line-height: 125% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Heading 2
	@tip Make the second-level headings larger in size for better readability on small screens.
	*/

            h2 {
                /*@editable*/

                font-size: 20px !important;
                /*@editable*/

                line-height: 125% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Heading 3
	@tip Make the third-level headings larger in size for better readability on small screens.
	*/

            h3 {
                /*@editable*/

                font-size: 18px !important;
                /*@editable*/

                line-height: 125% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Heading 4
	@tip Make the fourth-level headings larger in size for better readability on small screens.
	*/

            h4 {
                /*@editable*/

                font-size: 16px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Boxed Text
	@tip Make the boxed text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/

            .mcnBoxedTextContentContainer .mcnTextContent,
            .mcnBoxedTextContentContainer .mcnTextContent p {
                /*@editable*/

                font-size: 14px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Preheader Visibility
	@tip Set the visibility of the email's preheader on small screens. You can hide it to save space.
	*/

            #templatePreheader {
                /*@editable*/

                display: block !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Preheader Text
	@tip Make the preheader text larger in size for better readability on small screens.
	*/

            #templatePreheader .mcnTextContent,
            #templatePreheader .mcnTextContent p {
                /*@editable*/

                font-size: 14px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Header Text
	@tip Make the header text larger in size for better readability on small screens.
	*/

            #templateHeader .mcnTextContent,
            #templateHeader .mcnTextContent p {
                /*@editable*/

                font-size: 16px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Upper Body Text
	@tip Make the upper body text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/

            #templateUpperBody .mcnTextContent,
            #templateUpperBody .mcnTextContent p {
                /*@editable*/

                font-size: 16px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Column Text
	@tip Make the column text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/

            #templateColumns .columnContainer .mcnTextContent,
            #templateColumns .columnContainer .mcnTextContent p {
                /*@editable*/

                font-size: 16px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Lower Body Text
	@tip Make the lower body text larger in size for better readability on small screens. We recommend a font size of at least 16px.
	*/

            #templateLowerBody .mcnTextContent,
            #templateLowerBody .mcnTextContent p {
                /*@editable*/

                font-size: 16px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
        @media only screen and (max-width: 480px) {
            /*
	@tab Mobile Styles
	@section Footer Text
	@tip Make the footer content text larger in size for better readability on small screens.
	*/

            #templateFooter .mcnTextContent,
            #templateFooter .mcnTextContent p {
                /*@editable*/

                font-size: 14px !important;
                /*@editable*/

                line-height: 150% !important;
            }
        }
    </style>
</head>

<#macro currency amount isoCode="EUR" locale=locale>

  <#if !amount??>
    <#return>
  </#if>

  <#assign formatted = amount?string["#,##0.00"]>

  <#if isoCode == "EUR">

    <#if locale?string?starts_with("it")>
        ${formatted} &euro;
    <#else>
        ${formatted} EUR
    </#if>

  <#elseif isoCode == "USD">
    $${formatted}

  <#elseif isoCode == "GBP">
    £${formatted}

  <#else>
    ${formatted} ${isoCode}
  </#if>

</#macro>

<body>
    <center>
        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">
            <tr>
                <td align="center" valign="top" id="bodyCell">
                    <!-- BEGIN TEMPLATE // -->
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="templateContainer">
                        <tr>
                            <td valign="top" id="templatePreheader"></td>
                        </tr>
                        <tr>
                            <td valign="top" id="templateHeader">
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 2px none #EAEAEA;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnImageBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnImageBlockOuter">
                                        <tr>
                                            <td style="padding:9px" class="mcnImageBlockInner" valign="top">
                                                <table class="mcnImageContentContainer" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnImageContent" style="padding-right: 9px; padding-left: 9px; padding-top: 0; padding-bottom: 0; text-align:center;" valign="top">

                                                                <img alt="" src="https://www.fisico.it/images/fsasset/img/fisico/logo.png" style="max-width:730px; padding-bottom: 0; display: inline !important; vertical-align: bottom;" class="mcnImage" width="365" align="middle">

                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" id="templateUpperBody">
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width: 100%; padding: 9px 18px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 2px none #EAEAEA;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width:100%; padding:40px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 1px solid #DDDDDD;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnTextBlockOuter">
                                        <tr>
                                            <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">

                          <!-- @giulio ##################################### ORDER GENERAL INFO - from OrderHeader ##################################### -->
                                                <#assign fullDate = orderHeader.orderDate.toString() />
                                                <#assign orderDate = fullDate?keep_before_last(" ") />
                                                <table style="max-width:100%; min-width:100%;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnTextContent" style="padding: 0px 18px 9px; font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: center;" valign="top">
                                                                <h1>${emailLabelMap.ShippingConfirmationTitleMsg}!</h1> <#-- @giulio LABEL -->

                                                                <p style="font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: center;">${emailLabelMap.ShippingConfirmationOrderNumMsg} <strong>${orderHeader.orderId?if_exists}</strong> ${emailLabelMap.OrderConfirmationOrderOf} <strong>${orderDate?if_exists}</strong>, ${emailLabelMap.ShippingConfirmationOrderShipped}.
                                                                </p>

                                                                <div class="text" id="u5">
                                                                    <p style="font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: center;">${emailLabelMap.OrderConfirmationNeedHelp} <#-- LABEL -->
                                                                        <br> ${emailLabelMap.OrderConfirmationAtAddress} <a href="mailto:customercare@fisico.it">customercare@fisico.it</a>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                        <!-- @giulio ##################################### END ORDER GENERAL INFO - from OrderHeader ##################################### -->

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width:100%; padding:40px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 1px solid #DDDDDD;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnTextBlockOuter">
                                        <tr>
                                            <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">
                                                <table style="max-width:100%; min-width:100%;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnTextContent" style="padding: 0px 18px 9px; font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: center;" valign="top">
                                                                <!-- @giulio ########### LABEL "YOUR ORDER" ########### -->
                                                                <h1>${emailLabelMap.OrderConfirmationYourOrder}</h1>
                                                                <!-- @giulio ########### END LABEL "YOUR ORDER" ########### -->
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 2px none #EAEAEA;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                              <!-- @giulio @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ START ORDER ITEM LISTING @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                              <#assign subtotale = 0>
                              
                              <#list orderItems as orderItem>
                                
                                <#assign productRelated = orderItem.getRelatedOne("Product", true)?if_exists/> <#-- should always exist because of FK constraint, but just in case -->

                                <#assign fullProductId = productRelated.productId />

                                <#if fullProductId?contains(".")>
                                    <#assign productId = fullProductId?keep_before(".")/>
                                    <#assign itemSize = fullProductId?keep_after(".")/>
                                </#if>

                                <#-- @giulio Get the product record -->
                                <#assign product = delegator.findOne("Product", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("productId", productId), false) />
                                <#assign productImageUrl = product.smallImageUrl?if_exists /> <#-- @giulio at the moment small/medium/large image url are the same -->
                                
                                <#assign adjustment = 0 />
                                
                                <#assign orderItemAdjustment = delegator.findByAnd("OrderAdjustment", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("orderId",orderItem.orderId),null, false) />
                                
                                <#list orderItemAdjustment as adj >
                                	
                                	<#if adj.orderItemSeqId == orderItem.orderItemSeqId >
                                    	<#assign adjustment = adj.amount />
                                  	</#if>
                                
                                </#list>

                                <#if adjustment != 0 >
                                	
                                	<#assign percSconto = (( adjustment / orderItem.unitPrice ) * 100)?abs?ceiling />
                                  	<#assign nettoRiga = orderItem.unitPrice + adjustment />
                                  	<#assign subtotale = subtotale + nettoRiga />
                                
                                <#else>
                                  	<#assign subtotale = subtotale + orderItem.unitPrice />
                                
                                </#if>

                                <table class="mcnCaptionBlock" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnCaptionBlockOuter">
                                        <tr>
                                            <td class="mcnCaptionBlockInner" style="padding:15px 0; border-bottom:1px solid #eee;" valign="top">
                                                <table class="mcnCaptionRightContentOuter" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnCaptionRightContentInner" style="padding:0 9px ;" valign="top">
                                                              <!-- @giulio ####### ITEM IMAGE ####### -->
                                                                <table class="mcnCaptionRightImageContentContainer" cellspacing="0" cellpadding="0" border="0" align="left">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="mcnCaptionRightImageContent" valign="top" align="center" style="width:160px;">

                                                                                <img alt="" src="https://www.fisico.it/${productImageUrl?if_exists}" style="max-width:90px;" class="mcnImage" width="120">

                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <!-- @giulio ####### END ITEM IMAGE ####### -->

                                                                <!-- @giulio ####### ITEM DESCRIPTION ####### -->
                                                                <table class="mcnCaptionRightTextContentContainer" width="396" cellspacing="0" cellpadding="0" border="0" align="right" style="margin-top:30px;">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="mcnTextContent" style="line-height: 200%; text-align: right;" valign="top">
                                                                                <span>${orderItem.itemDescription?default("")}</span>
                                                                                <span style="color:#666;">
                                                                                    ${product.comments!} - ${itemSize!}
                                                                                </span><br>

                                                                                <#if adjustment != 0>
                                                                                    <span style="color:#999; text-decoration:line-through;">
                                                                                        <@currency amount=orderItem.unitPrice isoCode=currencyUomId />
                                                                                    </span>
                                                                                    &nbsp;
                                                                                    <span style="color:#dc3545;">(-${percSconto}%)</span><br>

                                                                                    <strong>
                                                                                        <@currency amount=nettoRiga isoCode=currencyUomId />
                                                                                    </strong>
                                                                                <#else>
                                                                                    <strong>
                                                                                        <@currency amount=orderItem.unitPrice isoCode=currencyUomId />
                                                                                    </strong>
                                                                                </#if>

                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <!-- @giulio ####### END ITEM DESCRIPTION ####### -->
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                    <#-- ${screens.render("component://lcbrandprod/widget/LCOrderScreens.xml#mpemailorderitem")} -->

                                <!-- @giulio #################################### ORDER ITEM 1 #################################### -->

                                <!-- @giulio #################################### END ORDER ITEM 2 #################################### -->
                                </#list>
                                <!-- @giulio @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ END ORDER ITEM LISTING @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" id="templateColumns">
                                
                                <table align="right" border="0" cellpadding="0" cellspacing="0" width="300" class="columnWrapper">
                                    <tr>
                                        <td valign="top" class="columnContainer">
                                            <#--
                                            <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                <tbody class="mcnDividerBlockOuter">
                                                    <tr>
                                                        <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">
                                                            <table class="mcnDividerContent" style="min-width: 100%;border-top: 1px solid #DDDDDD;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <span></span>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            -->
                                            <!-- @giulio ######################## ORDER TOTAL ######################## -->
                                             <#assign promoCodeMap = {} />
                                            <#assign orderPromocodeList = delegator.findByAnd("OrderProductPromoCode", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("orderId", orderHeader.orderId),null,false) />
                                            <#if ( orderPromocodeList?size > 0 ) >
                                              <#list orderPromocodeList as promoCode >
                                                <#assign promoCodeId = promoCode.productPromoCodeId />
                                                <#assign promoCodePromo = delegator.findOne("ProductPromoCode",Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("productPromoCodeId", promoCodeId), false) />
                                                <#assign orderAdjList = delegator.findByAnd("OrderAdjustment", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("orderId", orderHeader.orderId, "productPromoId", promoCodePromo.productPromoId), null, false) />

                                                <#if (orderAdjList?size == 1) >
                                                  <#assign orderPromoCodeAdj = Static["org.apache.ofbiz.entity.util.EntityUtil"].getFirst(orderAdjList) />
                                                  <#assign promoCodeMap = promoCodeMap + { promoCodeId : orderPromoCodeAdj.amount } />
                                                <#else>

                                                <#list orderAdjList as adj >
                                                  <#assign promoCodeMap = promoCodeMap + { promoCodeId : adj.amount } />
                                                </#list>
                                              </#if>
                                              </#list>

                                            </#if>
                                            
                                            
                                            <#assign orderSubTotal = orderHeader.remainingSubTotal />
                                            <#assign grandTotal = orderHeader.grandTotal />
                                            <#assign shipEstimates = grandTotal - orderSubTotal />
                                            <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0" align="right">
                                                <tbody class="mcnTextBlockOuter">
                                                    <tr>
                                                        <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">

                                                            <table style="max-width:100%; min-width:100%;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="right">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="mcnTextContent" style="padding: 0px 18px 9px;" valign="top" align="right">

                                                                            <div style="text-align: right;"><#--  ${emailLabelMap.OrderConfirmationOrderSubtotal}&nbsp;&nbsp; <@ofbizCurrency amount=orderSubTotal isoCode=currencyUomId />-->
                                                                                <br> 
                                                                                <#assign currentShippingAmount = shipEstimates />
                                                                                <#assign orderAdjustmentList = delegator.findList("OrderAdjustment",Static["org.apache.ofbiz.entity.condition.EntityCondition"].makeCondition(Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("orderId",orderHeader.orderId,"orderItemSeqId","_NA_")),null,null,null,false) />

                                                                                <#list orderAdjustmentList as orderAdjustment>
                                                                                  <#if orderAdjustment.productPromoId?? >
                                                                                    <#assign productPromoActionSeqId = orderAdjustment.productPromoActionSeqId />
                                                                                    <#assign productPromoRuleId = orderAdjustment.productPromoRuleId />
                                                                                    <#assign _productPromoAction= delegator.findOne("ProductPromoAction",false,Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("productPromoId",orderAdjustment.productPromoId,"productPromoActionSeqId",productPromoActionSeqId,"productPromoRuleId",productPromoRuleId)) />
                                                                                    <#if _productPromoAction?? && _productPromoAction?has_content && _productPromoAction.orderAdjustmentTypeId == "SHIPPING_CHARGES" >
                                                                                      <#assign currentShippingAmount = currentShippingAmount + orderAdjustment.amount />
                                                                                    </#if>
                                                                                  </#if>
                                                                                </#list>
                                                                                <#if currentShippingAmount != 0 >    
                                                                                    <#assign freeShippingThreshold = 150>

                                                                                    <#if orderSubTotal >= freeShippingThreshold>
                                                                                        ${emailLabelMap.OrderConfirmationShipEst}

                                                                                        <span style="color:#28a745; font-weight:bold;">
                                                                                           ${emailLabelMap.FreeShipping}
                                                                                        </span>
                                                                                    <#else>
                                                                                        ${emailLabelMap.OrderConfirmationShipEst}&nbsp;&nbsp;

                                                                                        <@currency amount=shipEstimates isoCode=currencyUomId />
                                                                                    </#if>
                                                                                </#if>
                                                                                <br>
                                                                                <#if promoCodeMap?? && ( promoCodeMap?size > 0 ) >
                                                                                 ${emailLabelMap.PromoCodeApplicati}<br>
                                                                                 <#list promoCodeMap?keys as k>
                                                                                   ${k} <@currency amount=promoCodeMap[k] isoCode=currencyUomId />
                                                                                 </#list>
                                                                               </#if>
                                                                                <br><strong>${emailLabelMap.OrderConfirmationOrderTotal} <@currency amount=grandTotal isoCode=currencyUomId /></strong>
                                                                            </div>

                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <!-- @giulio ######################## END ORDER TOTAL ######################## -->
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" id="templateLowerBody">
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 1px solid #DDDDDD;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnTextBlockOuter">
                                        <tr>
                                            <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">
                                                <!-- @giulio ######### ADRESSES SECTION TITLE ######### -->
                                                <table style="max-width:100%; min-width:100%;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnTextContent" style="padding: 0px 18px 9px 40px;; font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: center;" valign="top">
                                                                <h1 style="text-align:left;">${emailLabelMap.ShippingConfirmationShippingAddr}</h1>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <!-- @giulio ######### END ADRESSES SECTION TITLE ######### -->
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnTextBlockOuter">
                                        <tr>
                                            <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">

                                                <!-- @giulio ############# START SHIPPING ADDRESS INFO ############# -->
                                                <#assign orderId = orderHeader.orderId />
                                                <#assign orderShippingAddressList = delegator.findByAnd("OrderContactMech", {"orderId": orderId, "contactMechPurposeTypeId": "SHIPPING_LOCATION"}, null, false) />

                                                <#list orderShippingAddressList as shippingAddress>
                                                  <#assign postalAddress = delegator.findOne("PostalAddress", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("contactMechId", shippingAddress.contactMechId), false) />
                                                  <#assign country = delegator.findOne("Geo", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("geoId", postalAddress.countryGeoId), false) />
                                                  <#if postalAddress.stateProvinceGeoId?has_content && postalAddress.stateProvinceGeoId?contains("-") >
                                                        <#assign province = postalAddress.stateProvinceGeoId?keep_after("-") />
                                                    <#else>
                                                        <#assign province = postalAddress.stateProvinceGeoId! />
                                                    </#if>

                                                  <table style="max-width:300px;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                      <tbody>
                                                          <tr>
                                                               <td class="mcnTextContent" style="padding: 0px 18px 9px 0px; line-height: 200%;" valign="top">
                                                                <div class="ax_paragraph" id="u26">
                                                                    <div class="text" id="u27">
                                                                        <p style="line-height: 200%;"><strong><span>${emailLabelMap.OrderConfirmationShippingAddr}</span></strong>
                                                                            <br>
                                                                            <strong>${postalAddress.toName?capitalize}</strong><br>
                                                                            ${postalAddress.address1?capitalize}<br>
                                                                            ${postalAddress.postalCode!} ${postalAddress.city?capitalize}<br>
                                                                            (${province!}) - ${country.geoName!}<br>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <p>&nbsp;</p>
                                                            </td>
                                                          </tr>
                                                      </tbody>
                                                  </table>
                                                </#list>
                                                <!-- @giulio ############# END SHIPPING ADDRESS INFO ############# -->

                                                <!-- @giulio ############# START BILLING ADDRESS INFO #############
                                                <table style="max-width:300px;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>

                                                            <td class="mcnTextContent" style="padding: 0px 18px 9px;line-height: 200%;" valign="top">

                                                                <div class="ax_paragraph" id="u26">
                                                                    <div class="text" id="u27">
                                                                        <p style="line-height: 200%;"><strong><span>Indirizzo di fatturazione</span></strong>
                                                                            <br>
                                                                            <span>Mario Rossi</span>
                                                                            <br>
                                                                            <span>Via Roma 1 - Scala C</span>
                                                                            <br>
                                                                            <span>20100 Milano - Italia</span>
                                                                        </p>
                                                                    </div>
                                                                </div>

                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                              -->
                                                <!-- @giulio ############# END BILLING ADDRESS INFO ############# -->

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 1px solid #DDDDDD;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnTextBlockOuter">
                                        <tr>
                                            <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">
                                                <table style="max-width:100%; min-width:100%;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnTextContent" style="padding: 0px 18px 40px 40px; font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: left;" valign="top">
                                                                <p style="font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: left;">${emailLabelMap.OrderConfirmationBye},
                                                                    <br> ${emailLabelMap.NewsletterFisicoTeam}</p>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- LOGO footer -->
                                <table class="mcnImageBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnImageBlockOuter">
                                        <tr>
                                            <td style="padding:0px" class="mcnImageBlockInner" valign="top">
                                                <table class="mcnImageContentContainer" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnImageContent" style="padding-right: 0px; padding-left: 0px; padding-top: 0; padding-bottom: 0; text-align:center;" valign="top">

                                                                <p style="font-family: &quot;Montserrat&quot;, Arial, sans-serif; font-size: 12px; text-align: left; font-style: italic;">${emailLabelMap.MailNoReply}</p>

                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <!-- @giulio ################### START FOOTER ################### -->
                            <td valign="top" id="templateFooter">
                                <table class="mcnDividerBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnDividerBlockOuter">
                                        <tr>
                                            <td class="mcnDividerBlockInner" style="min-width:100%; padding:18px;">
                                                <table class="mcnDividerContent" style="min-width: 100%;border-top: 2px none #EAEAEA;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnFollowBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnFollowBlockOuter">
                                        <tr>
                                            <td style="padding:9px" class="mcnFollowBlockInner" valign="top" align="center">
                                                <table class="mcnFollowContentContainer" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td style="padding-left:9px;padding-right:9px;" align="center">
                                                                <table style="min-width:100%;" class="mcnFollowContent" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="padding-top:9px; padding-right:9px; padding-left:9px;" valign="top" align="center">
                                                                                <table cellspacing="0" cellpadding="0" border="0" align="center">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td valign="top" align="center">
                                                                                                <table style="display:inline;" cellspacing="0" cellpadding="0" border="0" align="left">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="padding-right:10px; padding-bottom:9px;" class="mcnFollowContentItemContainer" valign="top">
                                                                                                                <table class="mcnFollowContentItem" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td style="padding-top:5px; padding-right:10px; padding-bottom:5px; padding-left:9px;" valign="middle" align="left">
                                                                                                                                <table width="" cellspacing="0" cellpadding="0" border="0" align="left">
                                                                                                                                    <tbody>
                                                                                                                                        <tr>
                                                                                                                                            <td class="mcnFollowIconContent" width="24" valign="middle" align="center">
                                                                                                                                                <a href="https://www.facebook.com/FisicoOfficial/" target="_blank"><img src="<@ofbizContentUrl>/dp_it/assets/images/facebook.png</@ofbizContentUrl>" style="display:block;" class="" height="24" width="24">
                                                                                                                                                </a>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </tbody>
                                                                                                                                </table>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <table style="display:inline;" cellspacing="0" cellpadding="0" border="0" align="left">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="padding-right:10px; padding-bottom:9px;" class="mcnFollowContentItemContainer" valign="top">
                                                                                                                <table class="mcnFollowContentItem" width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td style="padding-top:5px; padding-right:10px; padding-bottom:5px; padding-left:9px;" valign="middle" align="left">
                                                                                                                                <table width="" cellspacing="0" cellpadding="0" border="0" align="left">
                                                                                                                                    <tbody>
                                                                                                                                        <tr>
                                                                                                                                            <td class="mcnFollowIconContent" width="24" valign="middle" align="center">
                                                                                                                                                <a href="https://www.instagram.com/fisico_official/" target="_blank"><img src="<@ofbizContentUrl>/dp_it/assets/images/instagram.png</@ofbizContentUrl>" style="display:block;" class="" height="24" width="24">
                                                                                                                                                </a>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </tbody>
                                                                                                                                </table>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnTextBlockOuter">
                                        <tr>
                                            <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">
                                                <table style="max-width:100%; min-width:100%;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnTextContent" style="padding-top:0; padding-right:18px; padding-bottom:9px; padding-left:18px;" valign="top">
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="mcnTextBlock" style="min-width:100%;" width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tbody class="mcnTextBlockOuter">
                                        <tr>
                                            <td class="mcnTextBlockInner" style="padding-top:9px;" valign="top">
                                                <table style="max-width:100%; min-width:100%;" class="mcnTextContentContainer" width="100%" cellspacing="0" cellpadding="0" border="0" align="left">
                                                    <tbody>
                                                        <tr>
                                                            <td class="mcnTextContent" style="padding-top:0; padding-right:18px; padding-bottom:9px; padding-left:18px;" valign="top">
                                                                <div class="ax_paragraph" id="u18">
                                                                    <div class="text" id="u19">
                                                                        <p><span>Olmar and Mirta spa - P.IVA 01817070202</span>
                                                                            <br>
                                                                            <span>Via Cocapana, 9 - 46026 Quistello (MN) - Italy</span>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <!-- @giulio ################## END FOOTER ################## -->
                        </tr>
                    </table>
                    <!-- // END TEMPLATE -->
                </td>
            </tr>
        </table>
    </center>
</body>

</html>
