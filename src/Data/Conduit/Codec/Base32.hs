-- |
-- Module: Data.Conduit.Codec.Base32
-- Copyright: (c) 2014 Magnus Therning
-- License: BSD3
module Data.Conduit.Codec.Base32 where

import qualified Codec.Binary.Base32 as B32
import qualified Data.Conduit.Codec.Util as U

import Control.Monad.Catch (MonadThrow)
import Data.ByteString (ByteString, empty)
import Data.Conduit (Conduit)

encode :: (Monad m) => Conduit ByteString m ByteString
encode = U.encodeI B32.b32EncodePart B32.b32EncodeFinal empty

decode :: (Monad m, MonadThrow m) => Conduit ByteString m ByteString
decode = U.decodeI B32.b32DecodePart B32.b32DecodeFinal empty
