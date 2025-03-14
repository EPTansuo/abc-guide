/**CFile****************************************************************

  FileName    [retCore.c]

  SystemName  [ABC: Logic synthesis and verification system.]

  PackageName [Retiming package.]

  Synopsis    [The core retiming procedures.]

  Author      [Alan Mishchenko]
  
  Affiliation [UC Berkeley]

  Date        [Ver. 1.0. Started - Oct 31, 2006.]

  Revision    [$Id: retCore.c,v 1.00 2006/10/31 00:00:00 alanmi Exp $]

***********************************************************************/

#include "pntk.h"

ABC_NAMESPACE_IMPL_START


////////////////////////////////////////////////////////////////////////
///                        DECLARATIONS                              ///
////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////
///                     FUNCTION DEFINITIONS                         ///
////////////////////////////////////////////////////////////////////////

/**Function*************************************************************

  Synopsis    [Get the Function name of the network.]

  Description []
               
  SideEffects []

  SeeAlso     []

***********************************************************************/
const char* Abc_NtkGetFuncName( Abc_Ntk_t * pNtk ){
	// ABC_FUNC_NONE = 0,   // 0:  unknown
    // ABC_FUNC_SOP,	     // 1:  sum-of-products
    // ABC_FUNC_BDD,	     // 2:  binary decision diagrams
    // ABC_FUNC_AIG,	     // 3:  and-inverter graphs
    // ABC_FUNC_MAP,	     // 4:  standard cell library
    // ABC_FUNC_BLIFMV,      // 5:  BLIF-MV node functions
    // ABC_FUNC_BLACKBOX,    // 6:  black box about which nothing is known
    // ABC_FUNC_OTHER        // 7:  unused
	return pNtk->ntkFunc == ABC_FUNC_NONE ? "NONE" :
           pNtk->ntkFunc == ABC_FUNC_SOP ? "SOP" :
           pNtk->ntkFunc == ABC_FUNC_BDD ? "BDD" :
           pNtk->ntkFunc == ABC_FUNC_AIG ? "AIG" :
           pNtk->ntkFunc == ABC_FUNC_MAP ? "MAP" :
           pNtk->ntkFunc == ABC_FUNC_BLIFMV ? "BLIFMV" :
           pNtk->ntkFunc == ABC_FUNC_BLACKBOX ? "BLACKBOX" :
           pNtk->ntkFunc == ABC_FUNC_OTHER ? "OTHER" : "UNKNOWN";
}


/**Function*************************************************************

  Synopsis    [Get the Type name of the network.]

  Description []
               
  SideEffects []

  SeeAlso     []

***********************************************************************/
const char* Abc_NtkGetTypeName( Abc_Ntk_t * pNtk ){
    // ABC_NTK_NONE = 0,   // 0:  unknown
    // ABC_NTK_NETLIST,    // 1:  network with PIs/POs, latches, nodes, and nets
    // ABC_NTK_LOGIC,      // 2:  network with PIs/POs, latches, and nodes
    // ABC_NTK_STRASH,     // 3:  structurally hashed AIG (two input AND gates with c-attributes on edges)
    // ABC_NTK_OTHER       // 4:  unused
    return pNtk->ntkType == ABC_NTK_NONE ? "NONE" :
           pNtk->ntkType == ABC_NTK_NETLIST ? "NETLIST" :
           pNtk->ntkType == ABC_NTK_LOGIC ? "LOGIC" :
           pNtk->ntkType == ABC_NTK_STRASH ? "STRASH" :
           pNtk->ntkType == ABC_NTK_OTHER ? "OTHER" : "UNKNOWN";
}

/**Function*************************************************************

  Synopsis    [Prints the network.]

  Description []
               
  SideEffects []

  SeeAlso     []

***********************************************************************/
void Abc_NtkPrint( Abc_Ntk_t * pNtk , int pPi, int pPo, int pNode, int pNet, int pLatch){
    if(!pNtk || (size_t)pNtk == 1) { 
        Abc_Print( 0, "Network is NULL\n" );
        return;
    }
    Abc_Print( 1, "Network %s:  PI = %d. PO = %d. Nodes = %d. Nets = %d. Latches= %d. Levels = %d.\n", 
        pNtk->pName, Abc_NtkPiNum(pNtk), Abc_NtkPoNum(pNtk), Abc_NtkNodeNum(pNtk), Abc_NtkNetNum(pNtk), 
        Abc_NtkLatchNum(pNtk), Abc_NtkLevel(pNtk) );
    Abc_Print( 1, "Function: %s\n", Abc_NtkGetFuncName(pNtk) );
    Abc_Print( 1, "Type: %s\n", Abc_NtkGetTypeName(pNtk) );
    int i;
    Abc_Obj_t * pAttr;
    if(pPi){
        Abc_NtkForEachPi( pNtk, pAttr, i )
            Abc_Print( 1, "PI %2d : %s\n", i, Abc_ObjName(pAttr) );
    }
    if(pPo){
        Abc_NtkForEachPo( pNtk, pAttr, i )
            Abc_Print( 1, "PO %2d : %s\n", i, Abc_ObjName(pAttr) );
    }
    // Abc_NtkForEachNode( pNtk, pAttr, i )
    //     Abc_Print( 1, "Node %2d : %s\n", i, Abc_ObjName(pAttr) );
    if(pNet){
        Abc_NtkForEachNet( pNtk, pAttr, i )
            Abc_Print( 1, "Net  %2d : %s\n", i, Abc_ObjName(pAttr) );
    }
    if(pLatch){
        Abc_NtkForEachLatch( pNtk, pAttr, i )
            Abc_Print( 1, "Latch %2d : %s\n", i, Abc_ObjName(pAttr) );
        Abc_NtkForEachLatchInput( pNtk, pAttr, i )
            Abc_Print( 1, "LatchInput %2d : %s\n", i, Abc_ObjName(pAttr) );
        Abc_NtkForEachLatchOutput( pNtk, pAttr, i )
            Abc_Print( 1, "LatchOutput %2d : %s\n", i, Abc_ObjName(pAttr) );
    }
    if(pNode){
        Abc_NtkForEachNode( pNtk, pAttr, i ){
            Abc_Print( 1, "Node %2d : %s\n", i, Abc_ObjName(pAttr) );
            Abc_Obj_t * pFan;
            int j;
            Abc_ObjForEachFanin( pAttr, pFan, j )
                Abc_Print( 1, "  Fanin %2d : %s\n", j, Abc_ObjName(pFan) );
            Abc_ObjForEachFanout( pAttr, pFan, j )
                Abc_Print( 1, "  Fanout %2d : %s\n", j, Abc_ObjName(pFan) );
        }
    }
}


////////////////////////////////////////////////////////////////////////
///                       END OF FILE                                ///
////////////////////////////////////////////////////////////////////////


ABC_NAMESPACE_IMPL_END

