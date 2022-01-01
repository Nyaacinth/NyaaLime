import {Image, Quad} from "love.graphics"
import {IRenderable} from "../Renderable"

/** Tilemap Class */
export class Tilemap implements IRenderable {
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
     */
    constructor(tileset_image: Image, tile_width: number, tile_height: number, tilemap: number[][]) {
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
                love.graphics.draw(this.tileset_image, this.tileset[current], width_index * this.tile_width, height_index * this.tile_height)
            }
        }
    }
}
