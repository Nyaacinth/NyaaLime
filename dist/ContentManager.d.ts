import { Source, SourceType } from "love.audio";
import { HintingMode } from "love.font";
import { Font, Shader } from "love.graphics";
import { ImageData } from "love.image";
/** Content Manager Class */
export declare class ContentManager {
    /** Content Base URL */
    protected base_url: string;
    /**
     * Content Manager Constructor
     * @param base_url Content Base URL
     */
    constructor(base_url: string);
    /**
     * Try to resolve filepath with given information, resolving failed will throw an error
     * @param domain Path Domain
     * @param filename Filename to search
     * @param valid_formats Valid Formats (without dots)
     * @param domain_displayname Display name of the path domain
     * @returns Resolved filepath
     */
    resolveAssetsPath(domain: string, filename: string, valid_formats: string[], domain_displayname?: string): string;
    /** Valid Audio Formats */
    protected audio_formats: string[];
    /** Audio Cache Field */
    protected audio_cache: {
        [filaname_and_type: string]: Source;
    };
    /**
     * Get audio source with given filename
     * @description You may need to `clone()` it before use, since the source will be shared with other functions
     * @param filename Filename to search
     * @param type Type of source
     */
    getSource(filename: string, type: SourceType): Source;
    /** Valid Image Formats */
    protected image_formats: string[];
    /** Image Cache Field */
    protected image_data_cache: {
        [filename: string]: ImageData;
    };
    /**
     * Get the image data with given filename
     * @param filename Filename to search
     */
    getImageData(filename: string): ImageData;
    /** Valid Font Formats */
    protected font_formats: string[];
    /** Font Cache Field */
    protected font_cache: {
        [filename_and_size_hint: string]: Font;
    };
    /**
     * Get the font with given filename
     * @param filename Filename to search
     * @param size Font size
     */
    getFont(filename: string, size: number, hint?: HintingMode): Font;
    /** Valid Shader Formats */
    protected shader_formats: string[];
    /** Shader Cache Field */
    protected shader_cache: {
        [filename: string]: Shader<any>;
    };
    /**
     * Get the shader with given filename
     * @param filename Filename to search
     */
    getShader<TShader extends {
        [sendable: string]: any;
    } = any>(filename: string): Shader<TShader>;
}
