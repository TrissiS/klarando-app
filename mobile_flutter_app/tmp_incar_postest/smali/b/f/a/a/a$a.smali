.class public Lb/f/a/a/a$a;
.super Ljava/lang/Object;
.source "ArcCurveFit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/a/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static s:[D


# instance fields
.field public a:[D

.field public b:D

.field public c:D

.field public d:D

.field public e:D

.field public f:D

.field public g:D

.field public h:D

.field public i:D

.field public j:D

.field public k:D

.field public l:D

.field public m:D

.field public n:D

.field public o:D

.field public p:D

.field public q:Z

.field public r:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x5b

    new-array v0, v0, [D

    .line 1
    sput-object v0, Lb/f/a/a/a$a;->s:[D

    return-void
.end method

.method public constructor <init>(IDDDDDD)V
    .registers 34

    move-object/from16 v9, p0

    move/from16 v0, p1

    move-wide/from16 v1, p2

    move-wide/from16 v3, p4

    move-wide/from16 v5, p6

    move-wide/from16 v7, p8

    move-wide/from16 v10, p10

    move-wide/from16 v12, p12

    .line 1
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v14, 0x0

    .line 2
    iput-boolean v14, v9, Lb/f/a/a/a$a;->r:Z

    const/4 v15, 0x1

    if-ne v0, v15, :cond_1a

    const/4 v14, 0x1

    .line 3
    :cond_1a
    iput-boolean v14, v9, Lb/f/a/a/a$a;->q:Z

    .line 4
    iput-wide v1, v9, Lb/f/a/a/a$a;->c:D

    .line 5
    iput-wide v3, v9, Lb/f/a/a/a$a;->d:D

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    sub-double v1, v3, v1

    div-double v1, v16, v1

    .line 6
    iput-wide v1, v9, Lb/f/a/a/a$a;->i:D

    const/4 v1, 0x3

    if-ne v1, v0, :cond_2d

    .line 7
    iput-boolean v15, v9, Lb/f/a/a/a$a;->r:Z

    :cond_2d
    sub-double v0, v10, v5

    sub-double v2, v12, v7

    .line 8
    iget-boolean v4, v9, Lb/f/a/a/a$a;->r:Z

    if-nez v4, :cond_91

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    const-wide v18, 0x3f50624dd2f1a9fcL    # 0.001

    cmpg-double v4, v16, v18

    if-ltz v4, :cond_91

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    cmpg-double v4, v16, v18

    if-gez v4, :cond_4b

    goto :goto_91

    :cond_4b
    const/16 v4, 0x65

    new-array v4, v4, [D

    .line 9
    iput-object v4, v9, Lb/f/a/a/a$a;->a:[D

    .line 10
    iget-boolean v4, v9, Lb/f/a/a/a$a;->q:Z

    if-eqz v4, :cond_57

    const/4 v4, -0x1

    goto :goto_58

    :cond_57
    const/4 v4, 0x1

    :goto_58
    int-to-double v14, v4

    mul-double v0, v0, v14

    iput-wide v0, v9, Lb/f/a/a/a$a;->j:D

    .line 11
    iget-boolean v0, v9, Lb/f/a/a/a$a;->q:Z

    if-eqz v0, :cond_63

    const/4 v15, 0x1

    goto :goto_64

    :cond_63
    const/4 v15, -0x1

    :goto_64
    int-to-double v0, v15

    mul-double v2, v2, v0

    iput-wide v2, v9, Lb/f/a/a/a$a;->k:D

    .line 12
    iget-boolean v0, v9, Lb/f/a/a/a$a;->q:Z

    if-eqz v0, :cond_6f

    move-wide v0, v10

    goto :goto_70

    :cond_6f
    move-wide v0, v5

    :goto_70
    iput-wide v0, v9, Lb/f/a/a/a$a;->l:D

    .line 13
    iget-boolean v0, v9, Lb/f/a/a/a$a;->q:Z

    if-eqz v0, :cond_78

    move-wide v0, v7

    goto :goto_79

    :cond_78
    move-wide v0, v12

    :goto_79
    iput-wide v0, v9, Lb/f/a/a/a$a;->m:D

    move-object/from16 v0, p0

    move-wide/from16 v1, p6

    move-wide/from16 v3, p8

    move-wide/from16 v5, p10

    move-wide/from16 v7, p12

    .line 14
    invoke-virtual/range {v0 .. v8}, Lb/f/a/a/a$a;->a(DDDD)V

    .line 15
    iget-wide v0, v9, Lb/f/a/a/a$a;->b:D

    iget-wide v2, v9, Lb/f/a/a/a$a;->i:D

    mul-double v0, v0, v2

    iput-wide v0, v9, Lb/f/a/a/a$a;->n:D

    return-void

    :cond_91
    :goto_91
    const/4 v4, 0x1

    .line 16
    iput-boolean v4, v9, Lb/f/a/a/a$a;->r:Z

    .line 17
    iput-wide v5, v9, Lb/f/a/a/a$a;->e:D

    .line 18
    iput-wide v10, v9, Lb/f/a/a/a$a;->f:D

    .line 19
    iput-wide v7, v9, Lb/f/a/a/a$a;->g:D

    .line 20
    iput-wide v12, v9, Lb/f/a/a/a$a;->h:D

    .line 21
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    iput-wide v4, v9, Lb/f/a/a/a$a;->b:D

    .line 22
    iget-wide v6, v9, Lb/f/a/a/a$a;->i:D

    mul-double v4, v4, v6

    iput-wide v4, v9, Lb/f/a/a/a$a;->n:D

    .line 23
    iget-wide v4, v9, Lb/f/a/a/a$a;->d:D

    iget-wide v6, v9, Lb/f/a/a/a$a;->c:D

    sub-double v10, v4, v6

    div-double/2addr v0, v10

    iput-wide v0, v9, Lb/f/a/a/a$a;->l:D

    sub-double/2addr v4, v6

    div-double/2addr v2, v4

    .line 24
    iput-wide v2, v9, Lb/f/a/a/a$a;->m:D

    return-void
.end method


# virtual methods
.method public a()D
    .registers 7

    .line 1
    iget-wide v0, p0, Lb/f/a/a/a$a;->j:D

    iget-wide v2, p0, Lb/f/a/a/a$a;->p:D

    mul-double v0, v0, v2

    .line 2
    iget-wide v2, p0, Lb/f/a/a/a$a;->k:D

    neg-double v2, v2

    iget-wide v4, p0, Lb/f/a/a/a$a;->o:D

    mul-double v2, v2, v4

    .line 3
    iget-wide v4, p0, Lb/f/a/a/a$a;->n:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    div-double/2addr v4, v2

    .line 4
    iget-boolean v2, p0, Lb/f/a/a/a$a;->q:Z

    if-eqz v2, :cond_19

    neg-double v0, v0

    :cond_19
    mul-double v0, v0, v4

    return-wide v0
.end method

.method public a(D)D
    .registers 3

    .line 5
    iget-wide p1, p0, Lb/f/a/a/a$a;->l:D

    return-wide p1
.end method

.method public final a(DDDD)V
    .registers 29

    move-object/from16 v0, p0

    sub-double v1, p5, p1

    sub-double v3, p3, p7

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    .line 6
    :goto_d
    sget-object v15, Lb/f/a/a/a$a;->s:[D

    array-length v5, v15

    if-ge v8, v5, :cond_4d

    const-wide v16, 0x4056800000000000L    # 90.0

    int-to-double v6, v8

    mul-double v6, v6, v16

    .line 7
    array-length v5, v15

    add-int/lit8 v5, v5, -0x1

    move-wide/from16 p4, v9

    int-to-double v9, v5

    div-double/2addr v6, v9

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    .line 8
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    .line 9
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    mul-double v9, v9, v1

    mul-double v5, v5, v3

    if-lez v8, :cond_42

    sub-double v11, v9, v11

    sub-double v13, v5, v13

    .line 10
    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v11

    add-double v11, p4, v11

    .line 11
    sget-object v7, Lb/f/a/a/a$a;->s:[D

    aput-wide v11, v7, v8

    goto :goto_44

    :cond_42
    move-wide/from16 v11, p4

    :goto_44
    add-int/lit8 v8, v8, 0x1

    move-wide v13, v5

    move-wide/from16 v18, v9

    move-wide v9, v11

    move-wide/from16 v11, v18

    goto :goto_d

    :cond_4d
    move-wide v11, v9

    .line 12
    iput-wide v11, v0, Lb/f/a/a/a$a;->b:D

    const/4 v1, 0x0

    .line 13
    :goto_51
    sget-object v2, Lb/f/a/a/a$a;->s:[D

    array-length v3, v2

    if-ge v1, v3, :cond_5e

    .line 14
    aget-wide v3, v2, v1

    div-double/2addr v3, v11

    aput-wide v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    :cond_5e
    const/4 v5, 0x0

    .line 15
    :goto_5f
    iget-object v1, v0, Lb/f/a/a/a$a;->a:[D

    array-length v2, v1

    if-ge v5, v2, :cond_aa

    int-to-double v2, v5

    .line 16
    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    int-to-double v6, v1

    div-double/2addr v2, v6

    .line 17
    sget-object v1, Lb/f/a/a/a$a;->s:[D

    invoke-static {v1, v2, v3}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v1

    if-ltz v1, :cond_80

    .line 18
    iget-object v2, v0, Lb/f/a/a/a$a;->a:[D

    sget-object v3, Lb/f/a/a/a$a;->s:[D

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    div-int/2addr v1, v3

    int-to-double v3, v1

    aput-wide v3, v2, v5

    const-wide/16 v6, 0x0

    goto :goto_a7

    :cond_80
    const/4 v4, -0x1

    if-ne v1, v4, :cond_8a

    .line 19
    iget-object v1, v0, Lb/f/a/a/a$a;->a:[D

    const-wide/16 v6, 0x0

    aput-wide v6, v1, v5

    goto :goto_a7

    :cond_8a
    const-wide/16 v6, 0x0

    neg-int v1, v1

    add-int/lit8 v4, v1, -0x2

    add-int/lit8 v1, v1, -0x1

    int-to-double v8, v4

    .line 20
    sget-object v10, Lb/f/a/a/a$a;->s:[D

    aget-wide v11, v10, v4

    sub-double/2addr v2, v11

    aget-wide v11, v10, v1

    aget-wide v13, v10, v4

    sub-double/2addr v11, v13

    div-double/2addr v2, v11

    add-double/2addr v8, v2

    array-length v1, v10

    add-int/lit8 v1, v1, -0x1

    int-to-double v1, v1

    div-double/2addr v8, v1

    .line 21
    iget-object v1, v0, Lb/f/a/a/a$a;->a:[D

    aput-wide v8, v1, v5

    :goto_a7
    add-int/lit8 v5, v5, 0x1

    goto :goto_5f

    :cond_aa
    return-void
.end method

.method public b()D
    .registers 7

    .line 1
    iget-wide v0, p0, Lb/f/a/a/a$a;->j:D

    iget-wide v2, p0, Lb/f/a/a/a$a;->p:D

    mul-double v0, v0, v2

    .line 2
    iget-wide v2, p0, Lb/f/a/a/a$a;->k:D

    neg-double v2, v2

    iget-wide v4, p0, Lb/f/a/a/a$a;->o:D

    mul-double v2, v2, v4

    .line 3
    iget-wide v4, p0, Lb/f/a/a/a$a;->n:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    div-double/2addr v4, v0

    .line 4
    iget-boolean v0, p0, Lb/f/a/a/a$a;->q:Z

    if-eqz v0, :cond_1c

    neg-double v0, v2

    mul-double v0, v0, v4

    goto :goto_1e

    :cond_1c
    mul-double v0, v2, v4

    :goto_1e
    return-wide v0
.end method

.method public b(D)D
    .registers 3

    .line 5
    iget-wide p1, p0, Lb/f/a/a/a$a;->m:D

    return-wide p1
.end method

.method public c()D
    .registers 7

    .line 1
    iget-wide v0, p0, Lb/f/a/a/a$a;->l:D

    iget-wide v2, p0, Lb/f/a/a/a$a;->j:D

    iget-wide v4, p0, Lb/f/a/a/a$a;->o:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method public c(D)D
    .registers 7

    .line 2
    iget-wide v0, p0, Lb/f/a/a/a$a;->c:D

    sub-double/2addr p1, v0

    iget-wide v0, p0, Lb/f/a/a/a$a;->i:D

    mul-double p1, p1, v0

    .line 3
    iget-wide v0, p0, Lb/f/a/a/a$a;->e:D

    iget-wide v2, p0, Lb/f/a/a/a$a;->f:D

    sub-double/2addr v2, v0

    mul-double p1, p1, v2

    add-double/2addr v0, p1

    return-wide v0
.end method

.method public d()D
    .registers 7

    .line 1
    iget-wide v0, p0, Lb/f/a/a/a$a;->m:D

    iget-wide v2, p0, Lb/f/a/a/a$a;->k:D

    iget-wide v4, p0, Lb/f/a/a/a$a;->p:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method public d(D)D
    .registers 7

    .line 2
    iget-wide v0, p0, Lb/f/a/a/a$a;->c:D

    sub-double/2addr p1, v0

    iget-wide v0, p0, Lb/f/a/a/a$a;->i:D

    mul-double p1, p1, v0

    .line 3
    iget-wide v0, p0, Lb/f/a/a/a$a;->g:D

    iget-wide v2, p0, Lb/f/a/a/a$a;->h:D

    sub-double/2addr v2, v0

    mul-double p1, p1, v2

    add-double/2addr v0, p1

    return-wide v0
.end method

.method public e(D)D
    .registers 11

    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gtz v2, :cond_7

    return-wide v0

    :cond_7
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v0

    if-ltz v2, :cond_e

    return-wide v0

    .line 1
    :cond_e
    iget-object v0, p0, Lb/f/a/a/a$a;->a:[D

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    int-to-double v1, v1

    mul-double p1, p1, v1

    double-to-int v1, p1

    int-to-double v2, v1

    sub-double/2addr p1, v2

    .line 2
    aget-wide v2, v0, v1

    add-int/lit8 v4, v1, 0x1

    aget-wide v4, v0, v4

    aget-wide v6, v0, v1

    sub-double/2addr v4, v6

    mul-double p1, p1, v4

    add-double/2addr v2, p1

    return-wide v2
.end method

.method public f(D)V
    .registers 5

    .line 1
    iget-boolean v0, p0, Lb/f/a/a/a$a;->q:Z

    if-eqz v0, :cond_8

    iget-wide v0, p0, Lb/f/a/a/a$a;->d:D

    sub-double/2addr v0, p1

    goto :goto_c

    :cond_8
    iget-wide v0, p0, Lb/f/a/a/a$a;->c:D

    sub-double v0, p1, v0

    :goto_c
    iget-wide p1, p0, Lb/f/a/a/a$a;->i:D

    mul-double v0, v0, p1

    const-wide p1, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 2
    invoke-virtual {p0, v0, v1}, Lb/f/a/a/a$a;->e(D)D

    move-result-wide v0

    mul-double v0, v0, p1

    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    iput-wide p1, p0, Lb/f/a/a/a$a;->o:D

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    iput-wide p1, p0, Lb/f/a/a/a$a;->p:D

    return-void
.end method
