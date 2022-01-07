//
//  AudioplayerViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 05/01/22.
//

import UIKit
import AVFoundation
import AVKit
import MapKit
class AudioplayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sourceLocation = CLLocationCoordinate2D(latitude: 28.704060, longitude: 77.102493)
               let destinationLocation = CLLocationCoordinate2D(latitude: 28.459497, longitude: 77.026634)
               
               createPath(sourceLocation: sourceLocation, destinationLocation: destinationLocation)
               
               self.mapKit.delegate = self
        
    }
    @IBOutlet var mapKit: MKMapView!
    
    @IBAction func Audiobutton(_ sender: UIButton) {
        guard let url = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")else {return}
               let player = AVPlayer(url: url)
               var playerController = AVPlayerViewController()
               playerController.player = player
               playerController.allowsPictureInPicturePlayback = true
               playerController.player?.play()
               self.present(playerController, animated: true, completion: nil)
    }
    

func createPath(sourceLocation : CLLocationCoordinate2D, destinationLocation : CLLocationCoordinate2D) {
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        
        let sourceMapItem = MKMapItem(placemark: sourcePlaceMark)
        let destinationItem = MKMapItem(placemark: destinationPlaceMark)
        
        
        let sourceAnotation = MKPointAnnotation()
        sourceAnotation.title = "Delhi"
        sourceAnotation.subtitle = "The Capital of INIDA"
        if let location = sourcePlaceMark.location {
            sourceAnotation.coordinate = location.coordinate
        }
        
        let destinationAnotation = MKPointAnnotation()
        destinationAnotation.title = "Gurugram"
        destinationAnotation.subtitle = "The HUB of IT Industries"
        if let location = destinationPlaceMark.location {
            destinationAnotation.coordinate = location.coordinate
        }
        
        self.mapKit.showAnnotations([sourceAnotation, destinationAnotation], animated: true)
        
        
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationItem
        directionRequest.transportType = .automobile
        
        let direction = MKDirections(request: directionRequest)
        
        
        direction.calculate { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("ERROR FOUND : \(error.localizedDescription)")
                }
                return
            }
            
            let route = response.routes[0]
            self.mapKit.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            
            self.mapKit.setRegion(MKCoordinateRegion(rect), animated: true)
            
        }
    }

}

extension AudioplayerViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let rendere = MKPolylineRenderer(overlay: overlay)
        rendere.lineWidth = 5
        rendere.strokeColor = .systemBlue
        
        return rendere
    }
}
