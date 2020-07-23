use LWP::UserAgent;
use JSON;
use strict;    #use this all times
use warnings;  #this too - helps a lot!
use Data::Dumper;
#use utf8;

my $ua = LWP::UserAgent->new;
my $server_endpoint = "https://wsapi.simsimi.com/190410/talk";
my $req = HTTP::Request->new(POST => $server_endpoint);

$req->header('content-type' => 'application/json');

$req->header('x-api-key' => 'VV5ehx~UOFh_~GE_9l3GgrMFUZOajKo~-HZtVnF2');

# add POST data to HTTP request body
my $post_data = '{"utext" : "ดีจ้า", "lang" : "th", "atext_bad_prob_max": "0.7"}';

$req->content($post_data);

my $resp = $ua->request($req);
if ($resp->is_success) {
    my $message = $resp->decoded_content;
    my $text = decode_json($message);
    print "Response: $text->{'atext'}\n";
}
else {
    print "HTTP POST error code: ", $resp->code, "\n";
    print "HTTP POST error message: ", $resp->message, "\n";
}
