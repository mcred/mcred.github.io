var timePalette = {
    css: '<link rel=\"stylesheet\" href=\"/assets/css/0-8.css\" type="text/css">',
    background: '<img src=\"/assets/images/main-background.png\" alt=\"main-background\">',
    currentTime: new Date().getHours(),
    load: function(){
        if (0 <= this.currentTime && this.currentTime < 8) {
            this.css = '<link rel=\"stylesheet\" href=\"/assets/css/0-8.css\" type="text/css">';
            this.background = '<img src=\"/assets/images//Site-Header-v2-0000.png\" alt=\"main-background\">';
        }
        if (8 <= this.currentTime && this.currentTime < 12) {
            this.css = '<link rel=\"stylesheet\" href=\"/assets/css/8-12.css\" type="text/css">';
            this.background = '<img src=\"/assets/images/Site-Header-v2-0800.png\" alt=\"main-background\">';
        }
        if (12 <= this.currentTime && this.currentTime < 18) {
            this.css = '<link rel=\"stylesheet\" href=\"/assets/css/12-18.css\" type="text/css">';
            this.background = '<img src=\"/assets/images/Site-Header-v2-1200.png\" alt=\"main-background\">';
        }
        if (18 <= this.currentTime && this.currentTime < 24) {
            this.css = '<link rel=\"stylesheet\" href=\"/assets/css/18-24.css\" type="text/css">';
            this.background = '<img src=\"/assets/images/Site-Header-v2-1800.png\" alt=\"main-background\">';
        }
    },
    getCss: function () {
        return unescape(this.css);
    },
    getBackground: function (){
        return this.background;
    }
}
