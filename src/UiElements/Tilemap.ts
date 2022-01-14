import {Image, Quad} from "love.graphics"
import {IUiElement} from "../UiElement"

/** Tilemap Class */
export class Tilemap implements IUiElement {
    /** Position X-axis */
    x: number

    /** Position Y-axis */
    y: number

    /** Drawing Width */
    get width() {
        let max_width = 0
        for (let height_index = 0; height_index < this.tilemap.length; height_index++) {
            max_width = Math.max(max_width, this.tilemap[height_index].length * this.tile_width)
        }
        return max_width
    }

    /** Drawing Height */
    get height() {
        return this.tilemap.length * this.tile_height
    }

    /** Tileset Image */
    tileset_image: Image

    /** Tileset Quads */
    tileset: Quad[] = []

    /** Tile Width */
    tile_width: number

    /** Tile Height */
    tile_height: number

    /** Tilemap Data */
    tilemap: number[][]

    /**
     * Tilemap Constructor
     * @param tileset_image Tileset Image
     * @param tile_width Tile Width
     * @param tile_height Tile Height
     * @param tilemap Tilemap Data
     * @param x Position X-axis
     * @param y Position Y-axis
     */
    constructor(tileset_image: Image, tile_width: number, tile_height: number, tilemap: number[][], x: number = 0, y: number = 0) {
        this.x = x
        this.y = y
        this.tileset_image = tileset_image
        this.tile_width = tile_width
        this.tile_height = tile_height
        this.tilemap = tilemap
        let image_width = tileset_image.getWidth(),
            image_height = tileset_image.getHeight()
        let width_frames = Math.floor(image_width / tile_width),
            height_frames = Math.floor(image_height / tile_height)
        this.tileset.push(love.graphics.newQuad(0, 0, 0, 0, image_width, image_height))
        for (let width_index = 0; width_index < width_frames; width_index++) {
            for (let height_index = 0; height_index < height_frames; height_index++) {
                this.tileset.push(love.graphics.newQuad(width_index * tile_width, height_index * tile_height, tile_width, tile_height, image_width, image_height))
            }
        }
    }

    /** Update Method, no functional */
    update() {}

    /** Draw Method, draw the tilemap */
    draw() {
        for (let height_index = 0; height_index < this.tilemap.length; height_index++) {
            let current_column = this.tilemap[height_index]
            for (let width_index = 0; width_index < current_column.length; width_index++) {
                let current = current_column[width_index]
                love.graphics.draw(this.tileset_image, this.tileset[current], this.x + width_index * this.tile_width, this.y + height_index * this.tile_height)
            }
        }
    }
}
