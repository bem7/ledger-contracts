pragma solidity ^0.4.2;

contract ContractBuilder {

  /// Constructor structs
  /// -------------------

  /// Constants
  enum ConstVariant {
    Boolean,
    Integer,
    Digest
  }

  struct Const {
    ConstVariant variant;
    int integer;
    bool boolean;
    bytes32 digest;
  }

  /// Expressions
  enum ExprVariant {
    Now,
    Constant,
    Variable,
    Observation,
    Foldt,
    Plus,
    Equal,
    LessEqual,
    And,
    Not,
    IfElse
  }

  struct Expr {
    ExprVariant variant;
    bytes8 identifier1;
    bytes8 identifier2;
    uint const1;
    uint const2;
    uint const3;
    uint expr1;
    uint expr2;
    uint expr3;
  }

  /// Contracts
  enum ContrVariant {
    Zero,
    Translate,
    TranslateSpecialized,
    Both,
    Scale,
    Transfer,
    IfWithin,
    IfWithinSpecialized
  }

  struct Contr {
    ContrVariant variant;
    bytes8 identifier1;
    bytes8 identifier2;
    bytes8 identifier3;
    uint const1;
    uint expr1;
    uint expr2;
    uint expr3;
    uint contr1;
    uint contr2;
  }

  /// State
  /// -----

  /// Storage for constructions
  Const[] public consts;
  Expr[]  public exprs;
  Contr[] public contrs;

  /// Initializer
  function ContractBuilder() {
    consts.length++;
    exprs.length++;
    contrs.length++;
  }

  /// Constant constructors
  /// ---------------------

  /// Const for a boolean
  function constBoolean(bool b) internal returns (uint) {
    uint idx = nextConst();
    consts[idx] = Const({
      variant: ConstVariant.Boolean,
      boolean: b,
      integer: 0,
      digest: ""
    });
    return idx;
  }

  /// Const for an integer
  function constInteger(int i) internal returns (uint) {
    uint idx = nextConst();
    consts[idx] = Const({
      variant: ConstVariant.Integer,
      boolean: false,
      integer: i,
      digest: ""
    });
    return idx;
  }

  /// Const for a digest
  function constDigest(bytes32 d) internal returns (uint) {
    uint idx = nextConst();
    consts[idx] = Const({
      variant: ConstVariant.Digest,
      boolean: false,
      integer: 0,
      digest: d
    });
    return idx;
  }

  /// Expression constructors
  /// -----------------------

  /// Expr for now (time)
  function exprNow() internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Now,
      identifier1: "",
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: 0,
      expr2: 0,
      expr3: 0
    });
    return idx;
  }

  /// Expr for a const
  function exprConstant(uint k) internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Constant,
      identifier1: "",
      identifier2: "",
      const1: k,
      const2: 0,
      const3: 0,
      expr1: 0,
      expr2: 0,
      expr3: 0
    });
    return idx;
  }

  /// Expr for a variable
  function exprVariable(bytes8 x) internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Variable,
      identifier1: x,
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: 0,
      expr2: 0,
      expr3: 0
    });
    return idx;
  }

  /// Expr for an observation
  function exprObservation(bytes8 feed, uint k1, uint e1)
  internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Observation,
      identifier1: feed,
      identifier2: 0,
      const1: k1,
      const2: 0,
      const3: 0,
      expr1: e1,
      expr2: 0,
      expr3: 0
    });
    return idx;
  }

  /// Expr for an accumulation
  function exprFoldt(bytes8 i1, uint e1, uint e2, uint t, uint k) internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Foldt,
      identifier1: i1,
      identifier2: 0,
      const1: k,
      const2: 0,
      const3: 0,
      expr1: e1,
      expr2: e2,
      expr3: t
    });
    return idx;
  }

  /// Expr for addition
  function exprPlus(uint e1, uint e2)
  internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Plus,
      identifier1: "",
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: e1,
      expr2: e2,
      expr3: 0
    });
    return idx;
  }

  /// Expr for checking equality
  function exprEqual(uint e1, uint e2)
  internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Equal,
      identifier1: "",
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: e1,
      expr2: e2,
      expr3: 0
    });
    return idx;
  }

  /// Expr for <=
  function exprLessEqual(uint e1, uint e2)
  internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.LessEqual,
      identifier1: "",
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: e1,
      expr2: e2,
      expr3: 0
    });
    return idx;
  }

  /// Expr for logical and
  function exprAnd(uint e1, uint e2) internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.And,
      identifier1: "",
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: e1,
      expr2: e2,
      expr3: 0
    });
    return idx;
  }

  /// Expr for logical not
  function exprNot(uint e) internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.Not,
      identifier1: "",
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: e,
      expr2: 0,
      expr3: 0
    });
    return idx;
  }

  /// Expr for if-then-else
  function exprIfElse(uint e1, uint e2, uint e3) internal returns (uint) {
    uint idx = nextExpr();
    exprs[idx] = Expr({
      variant: ExprVariant.IfElse,
      identifier1: "",
      identifier2: "",
      const1: 0,
      const2: 0,
      const3: 0,
      expr1: e1,
      expr2: e2,
      expr3: e3
    });
    return idx;
  }

  /// Contract constructors
  /// ---------------------

  /// Ø
  function contrZero() internal returns (uint) {
    uint idx = nextContr();
    contrs[idx] = Contr({
      variant: ContrVariant.Zero,
      identifier1: "",
      identifier2: "",
      identifier3: "",
      const1: 0,
      expr1: 0,
      expr2: 0,
      expr3: 0,
      contr1: 0,
      contr2: 0
    });
    return idx;
  }

  /// k ↑ c
  function contrTranslate(uint t, uint c)
  internal returns (uint) {
    uint idx = nextContr();
    contrs[idx] = Contr({
      variant: ContrVariant.Translate,
      identifier1: "",
      identifier2: "",
      identifier3: "",
      const1: 0,
      expr1: t,
      expr2: 0,
      expr3: 0,
      contr1: c,
      contr2: 0
    });
    return idx;
  }

  /// c1 & c2
  function contrBoth(uint c1, uint c2) internal returns (uint) {
    uint idx = nextContr();
    contrs[idx] = Contr({
      variant: ContrVariant.Both,
      identifier1: "",
      identifier2: "",
      identifier3: "",
      const1: 0,
      expr1: 0,
      expr2: 0,
      expr3: 0,
      contr1: c1,
      contr2: c2
    });
    return idx;
  }

  /// e × c
  function contrScale(uint e, uint c) internal returns (uint) {
    uint idx = nextContr();
    contrs[idx] = Contr({
      variant: ContrVariant.Scale,
      identifier1: "",
      identifier2: "",
      identifier3: "",
      const1: 0,
      expr1: e,
      expr2: 0,
      expr3: 0,
      contr1: c,
      contr2: 0
    });
    return idx;
  }

  /// a(p → q)
  function contrTransfer(bytes8 a, bytes8 p, bytes8 q)
  internal returns (uint) {
    uint idx = nextContr();
    contrs[idx] = Contr({
      variant: ContrVariant.Transfer,
      identifier1: a,
      identifier2: p,
      identifier3: q,
      const1: 0,
      expr1: 0,
      expr2: 0,
      expr3: 0,
      contr1: 0,
      contr2: 0
    });
    return idx;
  }

  // if e within t1 of t2 then \x . c1 else \x .  c2
  function contrIfWithin(uint e, uint t1, uint t2, bytes8 x, uint c1, uint c2)
  internal returns (uint) {
    uint idx = nextContr();
    contrs[idx] = Contr({
      variant: ContrVariant.IfWithin,
      identifier1: x,
      identifier2: "",
      identifier3: "",
      const1: 0,
      expr1: e,
      expr2: t1,
      expr3: t2,
      contr1: c1,
      contr2: c2
    });
    return idx;
  }

  /// Constructor helpers
  /// -------------------

  function nextConst() internal returns (uint) {
    uint idx = consts.length;
    consts.length++;
    return idx;
  }

  function nextExpr() internal returns (uint) {
    uint idx = exprs.length;
    exprs.length++;
    return idx;
  }

  function nextContr() internal returns (uint) {
    uint idx = contrs.length;
    contrs.length++;
    return idx;
  }


}
