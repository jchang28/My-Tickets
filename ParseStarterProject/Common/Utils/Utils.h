//
//  Utils.h
//  My Tickets
//
//  Created by Jeff@Level3 on 3/5/15.
//
//

#ifndef My_Tickets_Utils_h
#define My_Tickets_Utils_h

#define MTDebug 1

#ifndef MTLog

#if MTDebug
#define MTLog NSLog
#else
#define MTLog //
#endif

#endif

#endif