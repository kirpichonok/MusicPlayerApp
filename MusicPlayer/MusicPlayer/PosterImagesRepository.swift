import Foundation

protocol PosterImagesRepository
{
    func fetchPosterImage(with stringUrl: String) async throws -> Data
}
