function [ findme, Fs ] = get_tune( uid )
%GET_TUNE Function that gets a music segment based on your UID.
%   [FINDME, FS] = get_tune(UID) takes your UID and exports a 
%   music segement from one of 39 music pieces from Peter Rudenko from the
%   online free music archive (http://freemusicarchive.org/).
%   Note: For this to work properly the 'rudenko_01.mp4' thru 
%   'rudenko_39.mp4' files must be located in the same directory.
%
%   INPUTS:
%       UID: A string of your uid (starting with 'u', not '0')
%
%   OUTPUTS:
%    FINDME: A 20 second music segment from one of 39 Peter Rudenko's
%            musical pieces
%        Fs: The sampling rate of the music file
%   

%   Function has been precompiled into get_tune.p