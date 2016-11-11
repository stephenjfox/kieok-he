module User
    (Action(..)
    ,parseInputArguments
    ) where

type DataKey = String

{-
The standard CRUD can be reduced to "Update" and "Read", or Fetch/Put in our case.
"Update" is an overwrite, not a compute. Overwriting nothingness with a value,
  simply begets the value.
  Likewise, overwriting existence with nothingness is the logical delete. Users
  will see a delete command, but the backing implementation will remain simple
"Fetch" is a read. Simple. STUPID simple.
  There is some degree of encoding that is going to need persistence, but this
  will be developed in a flexible fashion, such that inserting the change won't
  break the system.
-}
data Action = Fetch { key :: DataKey }
            | Put { key :: DataKey, value :: String }
            | BadInput { message :: String}
            deriving (Show)


{-
Let's read some user input!
-}
parseInputArguments :: [String] -> IO Action
parseInputArguments ("save":key:value:_) = do
    putStrLn $ "Saving rest of " ++ show value
    return $ Put key value

parseInputArguments ("get":key:_) = do
    putStrLn $ "GET for key '" ++ "'"
    return $ Fetch key

parseInputArguments [x] =
    return $ BadInput $ "did not understand command '" ++ x ++ "'"

parseInputArguments [] =
    return $ BadInput "no arguments were supplied"
