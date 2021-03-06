-- |
-- Module: Data.Conduit.Codec.Base64Url
-- Copyright: (c) 2014 Magnus Therning
-- License: BSD3
module Data.Conduit.Codec.Base64Url where

import qualified Codec.Binary.Base64Url as B64U
import qualified Data.Conduit.Codec.Util as U

import Control.Monad.Catch (MonadThrow)
import Data.ByteString (ByteString, empty)
import Data.Conduit (Conduit)

encode :: (Monad m) => Conduit ByteString m ByteString
encode = U.encodeI B64U.b64uEncodePart B64U.b64uEncodeFinal empty

decode :: (Monad m, MonadThrow m) => Conduit ByteString m ByteString
decode = U.decodeI B64U.b64uDecodePart B64U.b64uDecodeFinal empty
