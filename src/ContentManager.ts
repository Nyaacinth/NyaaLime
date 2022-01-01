import {Source, SourceType} from "love.audio"
import {HintingMode} from "love.font"
import {Font, Image, Shader} from "love.graphics"

/** Content Manager Class */
export class ContentManager {
    /** Contents Base URL */
    base_url = "assets"

    /** Get base URL */
    getBaseURL() {
        return this.base_url
    }

    /**
     * Set base URL
     * @param base_url Assets Base URL
     */
    setBaseURL(base_url: string) {
        this.base_url = base_url
    }

    /**
     * Try to resolve filepath with given information, resolving failed will throw an error
     * @param domain Path Domain
     * @param filename Filename to search
     * @param valid_formats Valid Formats (without dots)
     * @param domain_displayname Display name of the path domain
     * @returns Resolved filepath
     */
    resolveAssetsPath(domain: string, filename: string, valid_formats: string[], domain_displayname?: string) {
        for (let format of valid_formats) {
            let filepath = `${this.base_url}/${domain}/${filename}.${format}`
            if (love.filesystem.getInfo(filepath, "file")) {
                return filepath
            }
        }
        throw new Error(`Could not find ${domain_displayname ?? domain} file with filename "${filename}" in ${this.base_url}/${domain} folder`)
    }

    /** Valid Audio Formats */
    audio_formats = [
        "wav", "mp3", "ogg", "oga", "ogv", "699", "amf",
        "ams", "dbm", "dmf", "dsm", "far", "it", "j2b",
        "mdl", "med", "mod", "mt2", "mtm", "okt", "psm",
        "s3m", "stm", "ult", "umx", "xm", "abc", "mid",
        "pat", "flac"
    ]

    /** Audio Cache Field */
    protected audio_cache: {[filaname_and_type: string]: Source} = {}

    /**
     * Get audio source with given filename
     * @description You may need to `clone()` it before use, since the source will be shared with other functions
     * @param filename Filename to search
     * @param type Type of source
     */
    getSource(filename: string, type: SourceType) {
        let filaname_and_type = `${filename}?type=${type}`
        if (this.audio_cache[filaname_and_type]) {
            return this.audio_cache[filaname_and_type]
        }
        this.audio_cache[filaname_and_type] = love.audio.newSource(this.resolveAssetsPath("audio", filename, this.audio_formats), type)
        return this.audio_cache[filaname_and_type]
    }

    /** Valid Image Formats */
    image_formats = ["jpg", "jpeg", "png", "bmp", "tga", "hdr", "pic", "exr"]

    /** Image Cache Field */
    protected image_cache: {[filename: string]: Image} = {}

    /**
     * Get the image with given filename
     * @param filename Filename to search
     */
    getImage(filename: string) {
        if (this.image_cache[filename]) {
            return this.image_cache[filename]
        }
        this.image_cache[filename] = love.graphics.newImage(this.resolveAssetsPath("images", filename, this.image_formats, "image"))
        return this.image_cache[filename]
    }

    /** Valid Font Formats */
    font_formats = ["ttf", "otf", "ttc"]

    /** Font Cache Field */
    protected font_cache: {[filename_and_size_hint: string]: Font} = {}

    /**
     * Get the font with given filename
     * @param filename Filename to search
     * @param size Font size
     */
    getFont(filename: string, size: number, hint: HintingMode = "normal") {
        let filename_and_size_hint = `${filename}?size=${size}&hint=${hint}`
        if (this.font_cache[filename_and_size_hint]) {
            return this.font_cache[filename_and_size_hint]
        }
        this.font_cache[filename_and_size_hint] = love.graphics.newFont(this.resolveAssetsPath("fonts", filename, this.font_formats, "font"), size, hint)
        return this.font_cache[filename_and_size_hint]
    }

    /** Valid Shader Formats */
    shader_formats = ["vert", "tesc", "tese", "geom", "frag", "comp"]

    /** Shader Cache Field */
    protected shader_cache: {[filename: string]: Shader<any>} = {}

    /**
     * Get the shader with given filename
     * @param filename Filename to search
     */
    getShader<TShader extends {[sendable: string]: any} = any>(filename: string): Shader<TShader>
    //-------------------------//
    getShader(filename: string) {
        if (this.shader_cache[filename]) {
            return this.shader_cache[filename]
        }
        this.shader_cache[filename] = love.graphics.newShader<any>(this.resolveAssetsPath("shaders", filename, this.shader_formats, "shader"))
        return this.shader_cache[filename]
    }
}
