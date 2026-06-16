.class public Lb/f/a/b/n;
.super Ljava/lang/Object;
.source "MotionController.java"


# instance fields
.field public A:I

.field public a:Landroid/view/View;

.field public b:I

.field public c:I

.field public d:Lb/f/a/b/p;

.field public e:Lb/f/a/b/p;

.field public f:Lb/f/a/b/m;

.field public g:Lb/f/a/b/m;

.field public h:[Lb/f/a/a/b;

.field public i:Lb/f/a/a/b;

.field public j:F

.field public k:F

.field public l:F

.field public m:[I

.field public n:[D

.field public o:[D

.field public p:[Ljava/lang/String;

.field public q:[I

.field public r:I

.field public s:[F

.field public t:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/p;",
            ">;"
        }
    .end annotation
.end field

.field public u:[F

.field public v:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/c;",
            ">;"
        }
    .end annotation
.end field

.field public w:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/s;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/r;",
            ">;"
        }
    .end annotation
.end field

.field public y:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/a/b/g;",
            ">;"
        }
    .end annotation
.end field

.field public z:[Lb/f/a/b/l;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/f/a/b/n;->c:I

    .line 3
    new-instance v0, Lb/f/a/b/p;

    invoke-direct {v0}, Lb/f/a/b/p;-><init>()V

    iput-object v0, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    .line 4
    new-instance v0, Lb/f/a/b/p;

    invoke-direct {v0}, Lb/f/a/b/p;-><init>()V

    iput-object v0, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    .line 5
    new-instance v0, Lb/f/a/b/m;

    invoke-direct {v0}, Lb/f/a/b/m;-><init>()V

    iput-object v0, p0, Lb/f/a/b/n;->f:Lb/f/a/b/m;

    .line 6
    new-instance v0, Lb/f/a/b/m;

    invoke-direct {v0}, Lb/f/a/b/m;-><init>()V

    iput-object v0, p0, Lb/f/a/b/n;->g:Lb/f/a/b/m;

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 7
    iput v0, p0, Lb/f/a/b/n;->j:F

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lb/f/a/b/n;->k:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    iput v0, p0, Lb/f/a/b/n;->l:F

    const/4 v0, 0x4

    .line 10
    iput v0, p0, Lb/f/a/b/n;->r:I

    new-array v0, v0, [F

    .line 11
    iput-object v0, p0, Lb/f/a/b/n;->s:[F

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    const/4 v0, 0x1

    new-array v0, v0, [F

    .line 13
    iput-object v0, p0, Lb/f/a/b/n;->u:[F

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    .line 15
    sget v0, Lb/f/a/b/c;->e:I

    iput v0, p0, Lb/f/a/b/n;->A:I

    .line 16
    invoke-virtual {p0, p1}, Lb/f/a/b/n;->b(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a(F[F)F
    .registers 13

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-eqz p2, :cond_9

    .line 197
    aput v1, p2, v2

    goto :goto_29

    .line 198
    :cond_9
    iget v3, p0, Lb/f/a/b/n;->l:F

    float-to-double v3, v3

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    cmpl-double v7, v3, v5

    if-eqz v7, :cond_29

    .line 199
    iget v3, p0, Lb/f/a/b/n;->k:F

    cmpg-float v3, p1, v3

    if-gez v3, :cond_19

    const/4 p1, 0x0

    .line 200
    :cond_19
    iget v3, p0, Lb/f/a/b/n;->k:F

    cmpl-float v4, p1, v3

    if-lez v4, :cond_29

    float-to-double v7, p1

    cmpg-double v4, v7, v5

    if-gez v4, :cond_29

    sub-float/2addr p1, v3

    .line 201
    iget v3, p0, Lb/f/a/b/n;->l:F

    mul-float p1, p1, v3

    .line 202
    :cond_29
    :goto_29
    iget-object v3, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v3, v3, Lb/f/a/b/p;->h:Lb/f/a/a/c;

    const/high16 v4, 0x7fc00000    # Float.NaN

    .line 203
    iget-object v5, p0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_35
    :goto_35
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_57

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb/f/a/b/p;

    .line 204
    iget-object v7, v6, Lb/f/a/b/p;->h:Lb/f/a/a/c;

    if-eqz v7, :cond_35

    .line 205
    iget v8, v6, Lb/f/a/b/p;->j:F

    cmpg-float v9, v8, p1

    if-gez v9, :cond_4e

    move-object v3, v7

    move v0, v8

    goto :goto_35

    .line 206
    :cond_4e
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v7

    if-eqz v7, :cond_35

    .line 207
    iget v4, v6, Lb/f/a/b/p;->j:F

    goto :goto_35

    :cond_57
    if-eqz v3, :cond_76

    .line 208
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_60

    goto :goto_61

    :cond_60
    move v1, v4

    :goto_61
    sub-float/2addr p1, v0

    sub-float/2addr v1, v0

    div-float/2addr p1, v1

    float-to-double v4, p1

    .line 209
    invoke-virtual {v3, v4, v5}, Lb/f/a/a/c;->a(D)D

    move-result-wide v6

    double-to-float p1, v6

    mul-float p1, p1, v1

    add-float/2addr p1, v0

    if-eqz p2, :cond_76

    .line 210
    invoke-virtual {v3, v4, v5}, Lb/f/a/a/c;->b(D)D

    move-result-wide v0

    double-to-float v0, v0

    aput v0, p2, v2

    :cond_76
    return p1
.end method

.method public a()I
    .registers 4

    .line 325
    iget-object v0, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget v0, v0, Lb/f/a/b/p;->i:I

    .line 326
    iget-object v1, p0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/p;

    .line 327
    iget v2, v2, Lb/f/a/b/p;->i:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_a

    .line 328
    :cond_1d
    iget-object v1, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v1, v1, Lb/f/a/b/p;->i:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public a([F[I)I
    .registers 10

    const/4 v0, 0x0

    if-eqz p1, :cond_49

    .line 27
    iget-object v1, p0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lb/f/a/a/b;->a()[D

    move-result-object v1

    if-eqz p2, :cond_28

    .line 28
    iget-object v2, p0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/p;

    add-int/lit8 v5, v3, 0x1

    .line 29
    iget v4, v4, Lb/f/a/b/p;->s:I

    aput v4, p2, v3

    move v3, v5

    goto :goto_14

    :cond_28
    const/4 p2, 0x0

    const/4 v2, 0x0

    .line 30
    :goto_2a
    array-length v3, v1

    if-ge p2, v3, :cond_46

    .line 31
    iget-object v3, p0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    aget-object v3, v3, v0

    aget-wide v4, v1, p2

    iget-object v6, p0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v3, v4, v5, v6}, Lb/f/a/a/b;->a(D[D)V

    .line 32
    iget-object v3, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v4, p0, Lb/f/a/b/n;->m:[I

    iget-object v5, p0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v3, v4, v5, p1, v2}, Lb/f/a/b/p;->a([I[D[FI)V

    add-int/lit8 v2, v2, 0x2

    add-int/lit8 p2, p2, 0x1

    goto :goto_2a

    .line 33
    :cond_46
    div-int/lit8 v2, v2, 0x2

    return v2

    :cond_49
    return v0
.end method

.method public a(I)Lb/f/a/b/p;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/a/b/p;

    return-object p1
.end method

.method public a(FFF[F)V
    .registers 16

    .line 258
    iget-object v0, p0, Lb/f/a/b/n;->u:[F

    invoke-virtual {p0, p1, v0}, Lb/f/a/b/n;->a(F[F)F

    move-result p1

    .line 259
    iget-object v0, p0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    const/4 v1, 0x0

    if-eqz v0, :cond_5e

    .line 260
    aget-object v0, v0, v1

    float-to-double v2, p1

    iget-object p1, p0, Lb/f/a/b/n;->o:[D

    invoke-virtual {v0, v2, v3, p1}, Lb/f/a/a/b;->b(D[D)V

    .line 261
    iget-object p1, p0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    aget-object p1, p1, v1

    iget-object v0, p0, Lb/f/a/b/n;->n:[D

    invoke-virtual {p1, v2, v3, v0}, Lb/f/a/a/b;->a(D[D)V

    .line 262
    iget-object p1, p0, Lb/f/a/b/n;->u:[F

    aget p1, p1, v1

    .line 263
    :goto_20
    iget-object v9, p0, Lb/f/a/b/n;->o:[D

    array-length v0, v9

    if-ge v1, v0, :cond_2f

    .line 264
    aget-wide v4, v9, v1

    float-to-double v6, p1

    mul-double v4, v4, v6

    aput-wide v4, v9, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 265
    :cond_2f
    iget-object p1, p0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    if-eqz p1, :cond_51

    .line 266
    iget-object v0, p0, Lb/f/a/b/n;->n:[D

    array-length v1, v0

    if-lez v1, :cond_50

    .line 267
    invoke-virtual {p1, v2, v3, v0}, Lb/f/a/a/b;->a(D[D)V

    .line 268
    iget-object p1, p0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    iget-object v0, p0, Lb/f/a/b/n;->o:[D

    invoke-virtual {p1, v2, v3, v0}, Lb/f/a/a/b;->b(D[D)V

    .line 269
    iget-object v4, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v8, p0, Lb/f/a/b/n;->m:[I

    iget-object v9, p0, Lb/f/a/b/n;->o:[D

    iget-object v10, p0, Lb/f/a/b/n;->n:[D

    move v5, p2

    move v6, p3

    move-object v7, p4

    invoke-virtual/range {v4 .. v10}, Lb/f/a/b/p;->a(FF[F[I[D[D)V

    :cond_50
    return-void

    .line 270
    :cond_51
    iget-object v4, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v8, p0, Lb/f/a/b/n;->m:[I

    iget-object v10, p0, Lb/f/a/b/n;->n:[D

    move v5, p2

    move v6, p3

    move-object v7, p4

    invoke-virtual/range {v4 .. v10}, Lb/f/a/b/p;->a(FF[F[I[D[D)V

    return-void

    .line 271
    :cond_5e
    iget-object p1, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v0, p1, Lb/f/a/b/p;->l:F

    iget-object v2, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget v3, v2, Lb/f/a/b/p;->l:F

    sub-float/2addr v0, v3

    .line 272
    iget v3, p1, Lb/f/a/b/p;->m:F

    iget v4, v2, Lb/f/a/b/p;->m:F

    sub-float/2addr v3, v4

    .line 273
    iget v4, p1, Lb/f/a/b/p;->n:F

    iget v5, v2, Lb/f/a/b/p;->n:F

    sub-float/2addr v4, v5

    .line 274
    iget p1, p1, Lb/f/a/b/p;->o:F

    iget v2, v2, Lb/f/a/b/p;->o:F

    sub-float/2addr p1, v2

    add-float/2addr v4, v0

    add-float/2addr p1, v3

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v5, v2, p2

    mul-float v0, v0, v5

    mul-float v4, v4, p2

    add-float/2addr v0, v4

    .line 275
    aput v0, p4, v1

    sub-float/2addr v2, p3

    mul-float v3, v3, v2

    mul-float p1, p1, p3

    add-float/2addr v3, p1

    const/4 p1, 0x1

    .line 276
    aput v3, p4, p1

    return-void
.end method

.method public a(FIIFF[F)V
    .registers 25

    move-object/from16 v0, p0

    .line 277
    iget-object v1, v0, Lb/f/a/b/n;->u:[F

    move/from16 v2, p1

    invoke-virtual {v0, v2, v1}, Lb/f/a/b/n;->a(F[F)F

    move-result v1

    .line 278
    iget-object v2, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const-string v3, "translationX"

    const/4 v4, 0x0

    if-nez v2, :cond_13

    move-object v2, v4

    goto :goto_19

    :cond_13
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/a/b/r;

    .line 279
    :goto_19
    iget-object v5, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const-string v6, "translationY"

    if-nez v5, :cond_21

    move-object v5, v4

    goto :goto_27

    :cond_21
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/a/b/r;

    .line 280
    :goto_27
    iget-object v7, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const-string v8, "rotation"

    if-nez v7, :cond_2f

    move-object v7, v4

    goto :goto_35

    :cond_2f
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/a/b/r;

    .line 281
    :goto_35
    iget-object v9, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const-string v10, "scaleX"

    if-nez v9, :cond_3d

    move-object v9, v4

    goto :goto_43

    :cond_3d
    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/f/a/b/r;

    .line 282
    :goto_43
    iget-object v11, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const-string v12, "scaleY"

    if-nez v11, :cond_4b

    move-object v11, v4

    goto :goto_51

    :cond_4b
    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lb/f/a/b/r;

    .line 283
    :goto_51
    iget-object v13, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-nez v13, :cond_57

    move-object v3, v4

    goto :goto_5d

    :cond_57
    invoke-virtual {v13, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/g;

    .line 284
    :goto_5d
    iget-object v13, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-nez v13, :cond_63

    move-object v6, v4

    goto :goto_69

    :cond_63
    invoke-virtual {v13, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb/f/a/b/g;

    .line 285
    :goto_69
    iget-object v13, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-nez v13, :cond_6f

    move-object v8, v4

    goto :goto_75

    :cond_6f
    invoke-virtual {v13, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/f/a/b/g;

    .line 286
    :goto_75
    iget-object v13, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-nez v13, :cond_7b

    move-object v10, v4

    goto :goto_81

    :cond_7b
    invoke-virtual {v13, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lb/f/a/b/g;

    .line 287
    :goto_81
    iget-object v13, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-nez v13, :cond_86

    goto :goto_8c

    :cond_86
    invoke-virtual {v13, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/a/b/g;

    .line 288
    :goto_8c
    new-instance v12, Lb/f/a/a/h;

    invoke-direct {v12}, Lb/f/a/a/h;-><init>()V

    .line 289
    invoke-virtual {v12}, Lb/f/a/a/h;->a()V

    .line 290
    invoke-virtual {v12, v7, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/r;F)V

    .line 291
    invoke-virtual {v12, v2, v5, v1}, Lb/f/a/a/h;->b(Lb/f/a/b/r;Lb/f/a/b/r;F)V

    .line 292
    invoke-virtual {v12, v9, v11, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/r;Lb/f/a/b/r;F)V

    .line 293
    invoke-virtual {v12, v8, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/g;F)V

    .line 294
    invoke-virtual {v12, v3, v6, v1}, Lb/f/a/a/h;->b(Lb/f/a/b/g;Lb/f/a/b/g;F)V

    .line 295
    invoke-virtual {v12, v10, v4, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/g;Lb/f/a/b/g;F)V

    .line 296
    iget-object v13, v0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    if-eqz v13, :cond_da

    .line 297
    iget-object v2, v0, Lb/f/a/b/n;->n:[D

    array-length v3, v2

    if-lez v3, :cond_cb

    float-to-double v3, v1

    .line 298
    invoke-virtual {v13, v3, v4, v2}, Lb/f/a/a/b;->a(D[D)V

    .line 299
    iget-object v1, v0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    iget-object v2, v0, Lb/f/a/b/n;->o:[D

    invoke-virtual {v1, v3, v4, v2}, Lb/f/a/a/b;->b(D[D)V

    .line 300
    iget-object v1, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v5, v0, Lb/f/a/b/n;->m:[I

    iget-object v6, v0, Lb/f/a/b/n;->o:[D

    iget-object v7, v0, Lb/f/a/b/n;->n:[D

    move/from16 v2, p4

    move/from16 v3, p5

    move-object/from16 v4, p6

    invoke-virtual/range {v1 .. v7}, Lb/f/a/b/p;->a(FF[F[I[D[D)V

    :cond_cb
    move-object v1, v12

    move/from16 v2, p4

    move/from16 v3, p5

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p6

    .line 301
    invoke-virtual/range {v1 .. v6}, Lb/f/a/a/h;->a(FFII[F)V

    return-void

    .line 302
    :cond_da
    iget-object v13, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    const/4 v14, 0x0

    if-eqz v13, :cond_125

    .line 303
    iget-object v2, v0, Lb/f/a/b/n;->u:[F

    invoke-virtual {v0, v1, v2}, Lb/f/a/b/n;->a(F[F)F

    move-result v1

    .line 304
    iget-object v2, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    aget-object v2, v2, v14

    float-to-double v3, v1

    iget-object v1, v0, Lb/f/a/b/n;->o:[D

    invoke-virtual {v2, v3, v4, v1}, Lb/f/a/a/b;->b(D[D)V

    .line 305
    iget-object v1, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    aget-object v1, v1, v14

    iget-object v2, v0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v1, v3, v4, v2}, Lb/f/a/a/b;->a(D[D)V

    .line 306
    iget-object v1, v0, Lb/f/a/b/n;->u:[F

    aget v1, v1, v14

    .line 307
    :goto_fc
    iget-object v6, v0, Lb/f/a/b/n;->o:[D

    array-length v2, v6

    if-ge v14, v2, :cond_10b

    .line 308
    aget-wide v2, v6, v14

    float-to-double v4, v1

    mul-double v2, v2, v4

    aput-wide v2, v6, v14

    add-int/lit8 v14, v14, 0x1

    goto :goto_fc

    .line 309
    :cond_10b
    iget-object v1, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v5, v0, Lb/f/a/b/n;->m:[I

    iget-object v7, v0, Lb/f/a/b/n;->n:[D

    move/from16 v2, p4

    move/from16 v3, p5

    move-object/from16 v4, p6

    invoke-virtual/range {v1 .. v7}, Lb/f/a/b/p;->a(FF[F[I[D[D)V

    move-object v1, v12

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p6

    .line 310
    invoke-virtual/range {v1 .. v6}, Lb/f/a/a/h;->a(FFII[F)V

    return-void

    .line 311
    :cond_125
    iget-object v13, v0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v15, v13, Lb/f/a/b/p;->l:F

    iget-object v14, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget v0, v14, Lb/f/a/b/p;->l:F

    sub-float/2addr v15, v0

    .line 312
    iget v0, v13, Lb/f/a/b/p;->m:F

    move-object/from16 v16, v4

    iget v4, v14, Lb/f/a/b/p;->m:F

    sub-float/2addr v0, v4

    .line 313
    iget v4, v13, Lb/f/a/b/p;->n:F

    move-object/from16 v17, v10

    iget v10, v14, Lb/f/a/b/p;->n:F

    sub-float/2addr v4, v10

    .line 314
    iget v10, v13, Lb/f/a/b/p;->o:F

    iget v13, v14, Lb/f/a/b/p;->o:F

    sub-float/2addr v10, v13

    add-float/2addr v4, v15

    add-float/2addr v10, v0

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float v14, v13, p4

    mul-float v15, v15, v14

    mul-float v4, v4, p4

    add-float/2addr v15, v4

    const/4 v4, 0x0

    .line 315
    aput v15, p6, v4

    sub-float v13, v13, p5

    mul-float v0, v0, v13

    mul-float v10, v10, p5

    add-float/2addr v0, v10

    const/4 v4, 0x1

    .line 316
    aput v0, p6, v4

    .line 317
    invoke-virtual {v12}, Lb/f/a/a/h;->a()V

    .line 318
    invoke-virtual {v12, v7, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/r;F)V

    .line 319
    invoke-virtual {v12, v2, v5, v1}, Lb/f/a/a/h;->b(Lb/f/a/b/r;Lb/f/a/b/r;F)V

    .line 320
    invoke-virtual {v12, v9, v11, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/r;Lb/f/a/b/r;F)V

    .line 321
    invoke-virtual {v12, v8, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/g;F)V

    .line 322
    invoke-virtual {v12, v3, v6, v1}, Lb/f/a/a/h;->b(Lb/f/a/b/g;Lb/f/a/b/g;F)V

    move-object/from16 v4, v16

    move-object/from16 v10, v17

    .line 323
    invoke-virtual {v12, v10, v4, v1}, Lb/f/a/a/h;->a(Lb/f/a/b/g;Lb/f/a/b/g;F)V

    move-object v1, v12

    move/from16 v2, p4

    move/from16 v3, p5

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p6

    .line 324
    invoke-virtual/range {v1 .. v6}, Lb/f/a/a/h;->a(FFII[F)V

    return-void
.end method

.method public a(F[FI)V
    .registers 7

    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, p1, v0}, Lb/f/a/b/n;->a(F[F)F

    move-result p1

    .line 35
    iget-object v0, p0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    float-to-double v1, p1

    iget-object p1, p0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v0, v1, v2, p1}, Lb/f/a/a/b;->a(D[D)V

    .line 36
    iget-object p1, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v0, p0, Lb/f/a/b/n;->m:[I

    iget-object v1, p0, Lb/f/a/b/n;->n:[D

    invoke-virtual {p1, v0, v1, p2, p3}, Lb/f/a/b/p;->b([I[D[FI)V

    return-void
.end method

.method public a(IIFJ)V
    .registers 23

    move-object/from16 v0, p0

    .line 42
    const-class v1, D

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 43
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 44
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 45
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 46
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 47
    iget v6, v0, Lb/f/a/b/n;->A:I

    sget v7, Lb/f/a/b/c;->e:I

    if-eq v6, v7, :cond_27

    .line 48
    iget-object v7, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iput v6, v7, Lb/f/a/b/p;->q:I

    .line 49
    :cond_27
    iget-object v6, v0, Lb/f/a/b/n;->f:Lb/f/a/b/m;

    iget-object v7, v0, Lb/f/a/b/n;->g:Lb/f/a/b/m;

    invoke-virtual {v6, v7, v3}, Lb/f/a/b/m;->a(Lb/f/a/b/m;Ljava/util/HashSet;)V

    .line 50
    iget-object v6, v0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    if-eqz v6, :cond_8e

    .line 51
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v8, 0x0

    :cond_37
    :goto_37
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/f/a/b/c;

    .line 52
    instance-of v10, v9, Lb/f/a/b/i;

    if-eqz v10, :cond_66

    .line 53
    check-cast v9, Lb/f/a/b/i;

    .line 54
    new-instance v10, Lb/f/a/b/p;

    iget-object v15, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v14, v0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    move-object v11, v10

    move/from16 v12, p1

    move/from16 v13, p2

    move-object/from16 v16, v14

    move-object v14, v9

    invoke-direct/range {v11 .. v16}, Lb/f/a/b/p;-><init>(IILb/f/a/b/i;Lb/f/a/b/p;Lb/f/a/b/p;)V

    invoke-virtual {v0, v10}, Lb/f/a/b/n;->a(Lb/f/a/b/p;)V

    .line 55
    iget v9, v9, Lb/f/a/b/j;->f:I

    sget v10, Lb/f/a/b/c;->e:I

    if-eq v9, v10, :cond_37

    .line 56
    iput v9, v0, Lb/f/a/b/n;->c:I

    goto :goto_37

    .line 57
    :cond_66
    instance-of v10, v9, Lb/f/a/b/f;

    if-eqz v10, :cond_6e

    .line 58
    invoke-virtual {v9, v4}, Lb/f/a/b/c;->a(Ljava/util/HashSet;)V

    goto :goto_37

    .line 59
    :cond_6e
    instance-of v10, v9, Lb/f/a/b/k;

    if-eqz v10, :cond_76

    .line 60
    invoke-virtual {v9, v2}, Lb/f/a/b/c;->a(Ljava/util/HashSet;)V

    goto :goto_37

    .line 61
    :cond_76
    instance-of v10, v9, Lb/f/a/b/l;

    if-eqz v10, :cond_87

    if-nez v8, :cond_81

    .line 62
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 63
    :cond_81
    check-cast v9, Lb/f/a/b/l;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_37

    .line 64
    :cond_87
    invoke-virtual {v9, v5}, Lb/f/a/b/c;->b(Ljava/util/HashMap;)V

    .line 65
    invoke-virtual {v9, v3}, Lb/f/a/b/c;->a(Ljava/util/HashSet;)V

    goto :goto_37

    :cond_8e
    const/4 v8, 0x0

    :cond_8f
    const/4 v6, 0x0

    if-eqz v8, :cond_9c

    new-array v9, v6, [Lb/f/a/b/l;

    .line 66
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lb/f/a/b/l;

    iput-object v8, v0, Lb/f/a/b/n;->z:[Lb/f/a/b/l;

    .line 67
    :cond_9c
    invoke-virtual {v3}, Ljava/util/HashSet;->isEmpty()Z

    move-result v8

    const-string v9, ","

    const-string v10, "CUSTOM,"

    const/4 v11, 0x1

    if-nez v8, :cond_16f

    .line 68
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    iput-object v8, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    .line 69
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_b2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_10d

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 70
    invoke-virtual {v12, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_fc

    .line 71
    new-instance v13, Landroid/util/SparseArray;

    invoke-direct {v13}, Landroid/util/SparseArray;-><init>()V

    .line 72
    invoke-virtual {v12, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    aget-object v14, v14, v11

    .line 73
    iget-object v15, v0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_d5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_f7

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v7, v16

    check-cast v7, Lb/f/a/b/c;

    .line 74
    iget-object v11, v7, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    if-nez v11, :cond_e9

    :cond_e7
    :goto_e7
    const/4 v11, 0x1

    goto :goto_d5

    .line 75
    :cond_e9
    invoke-virtual {v11, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lb/f/c/a;

    if-eqz v11, :cond_e7

    .line 76
    iget v7, v7, Lb/f/a/b/c;->a:I

    invoke-virtual {v13, v7, v11}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto :goto_e7

    .line 77
    :cond_f7
    invoke-static {v12, v13}, Lb/f/a/b/r;->a(Ljava/lang/String;Landroid/util/SparseArray;)Lb/f/a/b/r;

    move-result-object v7

    goto :goto_100

    .line 78
    :cond_fc
    invoke-static {v12}, Lb/f/a/b/r;->b(Ljava/lang/String;)Lb/f/a/b/r;

    move-result-object v7

    :goto_100
    if-nez v7, :cond_103

    goto :goto_10b

    .line 79
    :cond_103
    invoke-virtual {v7, v12}, Lb/f/a/b/r;->a(Ljava/lang/String;)V

    .line 80
    iget-object v11, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    invoke-virtual {v11, v12, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_10b
    const/4 v11, 0x1

    goto :goto_b2

    .line 81
    :cond_10d
    iget-object v7, v0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    if-eqz v7, :cond_12b

    .line 82
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_115
    :goto_115
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_12b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/f/a/b/c;

    .line 83
    instance-of v11, v8, Lb/f/a/b/d;

    if-eqz v11, :cond_115

    .line 84
    iget-object v11, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    invoke-virtual {v8, v11}, Lb/f/a/b/c;->a(Ljava/util/HashMap;)V

    goto :goto_115

    .line 85
    :cond_12b
    iget-object v7, v0, Lb/f/a/b/n;->f:Lb/f/a/b/m;

    iget-object v8, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    invoke-virtual {v7, v8, v6}, Lb/f/a/b/m;->a(Ljava/util/HashMap;I)V

    .line 86
    iget-object v7, v0, Lb/f/a/b/n;->g:Lb/f/a/b/m;

    iget-object v8, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const/16 v11, 0x64

    invoke-virtual {v7, v8, v11}, Lb/f/a/b/m;->a(Ljava/util/HashMap;I)V

    .line 87
    iget-object v7, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_145
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_16f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 88
    invoke-virtual {v5, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_162

    .line 89
    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    goto :goto_163

    :cond_162
    const/4 v11, 0x0

    .line 90
    :goto_163
    iget-object v12, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    invoke-virtual {v12, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/f/a/b/r;

    invoke-virtual {v8, v11}, Lb/f/a/b/r;->a(I)V

    goto :goto_145

    .line 91
    :cond_16f
    invoke-virtual {v2}, Ljava/util/HashSet;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_23d

    .line 92
    iget-object v7, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    if-nez v7, :cond_180

    .line 93
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    .line 94
    :cond_180
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_184
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1e9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 95
    iget-object v8, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    invoke-virtual {v8, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_199

    goto :goto_184

    .line 96
    :cond_199
    invoke-virtual {v7, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1d7

    .line 97
    new-instance v8, Landroid/util/SparseArray;

    invoke-direct {v8}, Landroid/util/SparseArray;-><init>()V

    .line 98
    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    aget-object v11, v11, v12

    .line 99
    iget-object v12, v0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_1b1
    :goto_1b1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1d0

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lb/f/a/b/c;

    .line 100
    iget-object v14, v13, Lb/f/a/b/c;->d:Ljava/util/HashMap;

    if-nez v14, :cond_1c2

    goto :goto_1b1

    .line 101
    :cond_1c2
    invoke-virtual {v14, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lb/f/c/a;

    if-eqz v14, :cond_1b1

    .line 102
    iget v13, v13, Lb/f/a/b/c;->a:I

    invoke-virtual {v8, v13, v14}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto :goto_1b1

    .line 103
    :cond_1d0
    invoke-static {v7, v8}, Lb/f/a/b/s;->a(Ljava/lang/String;Landroid/util/SparseArray;)Lb/f/a/b/s;

    move-result-object v8

    move-wide/from16 v11, p4

    goto :goto_1dd

    :cond_1d7
    move-wide/from16 v11, p4

    .line 104
    invoke-static {v7, v11, v12}, Lb/f/a/b/s;->a(Ljava/lang/String;J)Lb/f/a/b/s;

    move-result-object v8

    :goto_1dd
    if-nez v8, :cond_1e0

    goto :goto_184

    .line 105
    :cond_1e0
    invoke-virtual {v8, v7}, Lb/f/a/b/s;->a(Ljava/lang/String;)V

    .line 106
    iget-object v13, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    invoke-virtual {v13, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_184

    .line 107
    :cond_1e9
    iget-object v2, v0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    if-eqz v2, :cond_209

    .line 108
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1f1
    :goto_1f1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_209

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/a/b/c;

    .line 109
    instance-of v8, v7, Lb/f/a/b/k;

    if-eqz v8, :cond_1f1

    .line 110
    check-cast v7, Lb/f/a/b/k;

    iget-object v8, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    invoke-virtual {v7, v8}, Lb/f/a/b/k;->c(Ljava/util/HashMap;)V

    goto :goto_1f1

    .line 111
    :cond_209
    iget-object v2, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_213
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_23d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 112
    invoke-virtual {v5, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_230

    .line 113
    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    goto :goto_231

    :cond_230
    const/4 v8, 0x0

    .line 114
    :goto_231
    iget-object v9, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    invoke-virtual {v9, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/a/b/s;

    invoke-virtual {v7, v8}, Lb/f/a/b/s;->a(I)V

    goto :goto_213

    .line 115
    :cond_23d
    iget-object v2, v0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v5, 0x2

    add-int/2addr v2, v5

    new-array v7, v2, [Lb/f/a/b/p;

    .line 116
    iget-object v8, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    aput-object v8, v7, v6

    add-int/lit8 v8, v2, -0x1

    .line 117
    iget-object v9, v0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    aput-object v9, v7, v8

    .line 118
    iget-object v8, v0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_260

    iget v8, v0, Lb/f/a/b/n;->c:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_260

    .line 119
    iput v6, v0, Lb/f/a/b/n;->c:I

    .line 120
    :cond_260
    iget-object v8, v0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v9, 0x1

    :goto_267
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_279

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lb/f/a/b/p;

    add-int/lit8 v12, v9, 0x1

    .line 121
    aput-object v11, v7, v9

    move v9, v12

    goto :goto_267

    :cond_279
    const/16 v8, 0x12

    .line 122
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 123
    iget-object v11, v0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget-object v11, v11, Lb/f/a/b/p;->r:Ljava/util/LinkedHashMap;

    invoke-virtual {v11}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_28c
    :goto_28c
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2bb

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 124
    iget-object v13, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v13, v13, Lb/f/a/b/p;->r:Ljava/util/LinkedHashMap;

    invoke-virtual {v13, v12}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_28c

    .line 125
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_28c

    .line 126
    invoke-virtual {v9, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_28c

    :cond_2bb
    new-array v3, v6, [Ljava/lang/String;

    .line 127
    invoke-virtual {v9, v3}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    iput-object v3, v0, Lb/f/a/b/n;->p:[Ljava/lang/String;

    .line 128
    array-length v3, v3

    new-array v3, v3, [I

    iput-object v3, v0, Lb/f/a/b/n;->q:[I

    const/4 v3, 0x0

    .line 129
    :goto_2cb
    iget-object v9, v0, Lb/f/a/b/n;->p:[Ljava/lang/String;

    array-length v10, v9

    if-ge v3, v10, :cond_2ff

    .line 130
    aget-object v9, v9, v3

    .line 131
    iget-object v10, v0, Lb/f/a/b/n;->q:[I

    aput v6, v10, v3

    const/4 v10, 0x0

    :goto_2d7
    if-ge v10, v2, :cond_2fc

    .line 132
    aget-object v11, v7, v10

    iget-object v11, v11, Lb/f/a/b/p;->r:Ljava/util/LinkedHashMap;

    invoke-virtual {v11, v9}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2f9

    .line 133
    iget-object v11, v0, Lb/f/a/b/n;->q:[I

    aget v12, v11, v3

    aget-object v10, v7, v10

    iget-object v10, v10, Lb/f/a/b/p;->r:Ljava/util/LinkedHashMap;

    invoke-virtual {v10, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/f/c/a;

    invoke-virtual {v9}, Lb/f/c/a;->c()I

    move-result v9

    add-int/2addr v12, v9

    aput v12, v11, v3

    goto :goto_2fc

    :cond_2f9
    add-int/lit8 v10, v10, 0x1

    goto :goto_2d7

    :cond_2fc
    :goto_2fc
    add-int/lit8 v3, v3, 0x1

    goto :goto_2cb

    .line 134
    :cond_2ff
    aget-object v3, v7, v6

    iget v3, v3, Lb/f/a/b/p;->q:I

    sget v9, Lb/f/a/b/c;->e:I

    if-eq v3, v9, :cond_309

    const/4 v3, 0x1

    goto :goto_30a

    :cond_309
    const/4 v3, 0x0

    .line 135
    :goto_30a
    iget-object v9, v0, Lb/f/a/b/n;->p:[Ljava/lang/String;

    array-length v9, v9

    add-int/2addr v8, v9

    new-array v9, v8, [Z

    const/4 v10, 0x1

    :goto_311
    if-ge v10, v2, :cond_321

    .line 136
    aget-object v11, v7, v10

    add-int/lit8 v12, v10, -0x1

    aget-object v12, v7, v12

    iget-object v13, v0, Lb/f/a/b/n;->p:[Ljava/lang/String;

    invoke-virtual {v11, v12, v9, v13, v3}, Lb/f/a/b/p;->a(Lb/f/a/b/p;[Z[Ljava/lang/String;Z)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_311

    :cond_321
    const/4 v3, 0x1

    const/4 v10, 0x0

    :goto_323
    if-ge v3, v8, :cond_32e

    .line 137
    aget-boolean v11, v9, v3

    if-eqz v11, :cond_32b

    add-int/lit8 v10, v10, 0x1

    :cond_32b
    add-int/lit8 v3, v3, 0x1

    goto :goto_323

    .line 138
    :cond_32e
    new-array v3, v10, [I

    iput-object v3, v0, Lb/f/a/b/n;->m:[I

    .line 139
    array-length v10, v3

    new-array v10, v10, [D

    iput-object v10, v0, Lb/f/a/b/n;->n:[D

    .line 140
    array-length v3, v3

    new-array v3, v3, [D

    iput-object v3, v0, Lb/f/a/b/n;->o:[D

    const/4 v3, 0x1

    const/4 v10, 0x0

    :goto_33e
    if-ge v3, v8, :cond_34e

    .line 141
    aget-boolean v11, v9, v3

    if-eqz v11, :cond_34b

    .line 142
    iget-object v11, v0, Lb/f/a/b/n;->m:[I

    add-int/lit8 v12, v10, 0x1

    aput v3, v11, v10

    move v10, v12

    :cond_34b
    add-int/lit8 v3, v3, 0x1

    goto :goto_33e

    .line 143
    :cond_34e
    iget-object v3, v0, Lb/f/a/b/n;->m:[I

    array-length v3, v3

    new-array v8, v5, [I

    const/4 v9, 0x1

    aput v3, v8, v9

    aput v2, v8, v6

    invoke-static {v1, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[D

    .line 144
    new-array v8, v2, [D

    const/4 v9, 0x0

    :goto_361
    if-ge v9, v2, :cond_376

    .line 145
    aget-object v10, v7, v9

    aget-object v11, v3, v9

    iget-object v12, v0, Lb/f/a/b/n;->m:[I

    invoke-virtual {v10, v11, v12}, Lb/f/a/b/p;->a([D[I)V

    .line 146
    aget-object v10, v7, v9

    iget v10, v10, Lb/f/a/b/p;->j:F

    float-to-double v10, v10

    aput-wide v10, v8, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_361

    :cond_376
    const/4 v9, 0x0

    .line 147
    :goto_377
    iget-object v10, v0, Lb/f/a/b/n;->m:[I

    array-length v11, v10

    if-ge v9, v11, :cond_3b8

    .line 148
    aget v10, v10, v9

    .line 149
    sget-object v11, Lb/f/a/b/p;->v:[Ljava/lang/String;

    array-length v11, v11

    if-ge v10, v11, :cond_3b5

    .line 150
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lb/f/a/b/p;->v:[Ljava/lang/String;

    iget-object v12, v0, Lb/f/a/b/n;->m:[I

    aget v12, v12, v9

    aget-object v11, v11, v12

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, " ["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    :goto_39d
    if-ge v11, v2, :cond_3b5

    .line 151
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v10, v3, v11

    aget-wide v13, v10, v9

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    add-int/lit8 v11, v11, 0x1

    goto :goto_39d

    :cond_3b5
    add-int/lit8 v9, v9, 0x1

    goto :goto_377

    .line 152
    :cond_3b8
    iget-object v9, v0, Lb/f/a/b/n;->p:[Ljava/lang/String;

    array-length v9, v9

    const/4 v10, 0x1

    add-int/2addr v9, v10

    new-array v9, v9, [Lb/f/a/a/b;

    iput-object v9, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    const/4 v9, 0x0

    .line 153
    :goto_3c2
    iget-object v10, v0, Lb/f/a/b/n;->p:[Ljava/lang/String;

    array-length v11, v10

    if-ge v9, v11, :cond_41e

    .line 154
    aget-object v10, v10, v9

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_3cd
    if-ge v11, v2, :cond_405

    .line 155
    aget-object v15, v7, v11

    invoke-virtual {v15, v10}, Lb/f/a/b/p;->b(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_400

    if-nez v14, :cond_3ef

    .line 156
    new-array v12, v2, [D

    .line 157
    aget-object v14, v7, v11

    invoke-virtual {v14, v10}, Lb/f/a/b/p;->a(Ljava/lang/String;)I

    move-result v14

    new-array v15, v5, [I

    const/16 v16, 0x1

    aput v14, v15, v16

    aput v2, v15, v6

    invoke-static {v1, v15}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, [[D

    .line 158
    :cond_3ef
    aget-object v15, v7, v11

    iget v15, v15, Lb/f/a/b/p;->j:F

    float-to-double v5, v15

    aput-wide v5, v12, v13

    .line 159
    aget-object v5, v7, v11

    aget-object v6, v14, v13

    const/4 v15, 0x0

    invoke-virtual {v5, v10, v6, v15}, Lb/f/a/b/p;->a(Ljava/lang/String;[DI)I

    add-int/lit8 v13, v13, 0x1

    :cond_400
    add-int/lit8 v11, v11, 0x1

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto :goto_3cd

    .line 160
    :cond_405
    invoke-static {v12, v13}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v5

    .line 161
    invoke-static {v14, v13}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[D

    .line 162
    iget-object v10, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    add-int/lit8 v9, v9, 0x1

    iget v11, v0, Lb/f/a/b/n;->c:I

    invoke-static {v11, v5, v6}, Lb/f/a/a/b;->a(I[D[[D)Lb/f/a/a/b;

    move-result-object v5

    aput-object v5, v10, v9

    const/4 v5, 0x2

    const/4 v6, 0x0

    goto :goto_3c2

    .line 163
    :cond_41e
    iget-object v5, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    iget v6, v0, Lb/f/a/b/n;->c:I

    invoke-static {v6, v8, v3}, Lb/f/a/a/b;->a(I[D[[D)Lb/f/a/a/b;

    move-result-object v3

    const/4 v6, 0x0

    aput-object v3, v5, v6

    .line 164
    aget-object v3, v7, v6

    iget v3, v3, Lb/f/a/b/p;->q:I

    sget v5, Lb/f/a/b/c;->e:I

    if-eq v3, v5, :cond_470

    .line 165
    new-array v3, v2, [I

    .line 166
    new-array v5, v2, [D

    const/4 v8, 0x2

    new-array v9, v8, [I

    const/4 v10, 0x1

    aput v8, v9, v10

    aput v2, v9, v6

    .line 167
    invoke-static {v1, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[D

    const/4 v15, 0x0

    :goto_444
    if-ge v15, v2, :cond_46a

    .line 168
    aget-object v6, v7, v15

    iget v6, v6, Lb/f/a/b/p;->q:I

    aput v6, v3, v15

    .line 169
    aget-object v6, v7, v15

    iget v6, v6, Lb/f/a/b/p;->j:F

    float-to-double v8, v6

    aput-wide v8, v5, v15

    .line 170
    aget-object v6, v1, v15

    aget-object v8, v7, v15

    iget v8, v8, Lb/f/a/b/p;->l:F

    float-to-double v8, v8

    const/4 v10, 0x0

    aput-wide v8, v6, v10

    .line 171
    aget-object v6, v1, v15

    aget-object v8, v7, v15

    iget v8, v8, Lb/f/a/b/p;->m:F

    float-to-double v8, v8

    const/4 v11, 0x1

    aput-wide v8, v6, v11

    add-int/lit8 v15, v15, 0x1

    goto :goto_444

    .line 172
    :cond_46a
    invoke-static {v3, v5, v1}, Lb/f/a/a/b;->a([I[D[[D)Lb/f/a/a/b;

    move-result-object v1

    iput-object v1, v0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    :cond_470
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 173
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    .line 174
    iget-object v2, v0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    if-eqz v2, :cond_4e5

    .line 175
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_481
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4ad

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 176
    invoke-static {v3}, Lb/f/a/b/g;->b(Ljava/lang/String;)Lb/f/a/b/g;

    move-result-object v4

    if-nez v4, :cond_494

    goto :goto_481

    .line 177
    :cond_494
    invoke-virtual {v4}, Lb/f/a/b/g;->a()Z

    move-result v5

    if-eqz v5, :cond_4a4

    .line 178
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_4a4

    .line 179
    invoke-virtual/range {p0 .. p0}, Lb/f/a/b/n;->d()F

    move-result v1

    .line 180
    :cond_4a4
    invoke-virtual {v4, v3}, Lb/f/a/b/g;->a(Ljava/lang/String;)V

    .line 181
    iget-object v5, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    invoke-virtual {v5, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_481

    .line 182
    :cond_4ad
    iget-object v2, v0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4b3
    :goto_4b3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4cb

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/c;

    .line 183
    instance-of v4, v3, Lb/f/a/b/f;

    if-eqz v4, :cond_4b3

    .line 184
    check-cast v3, Lb/f/a/b/f;

    iget-object v4, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    invoke-virtual {v3, v4}, Lb/f/a/b/f;->c(Ljava/util/HashMap;)V

    goto :goto_4b3

    .line 185
    :cond_4cb
    iget-object v2, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4d5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4e5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/g;

    .line 186
    invoke-virtual {v3, v1}, Lb/f/a/b/g;->c(F)V

    goto :goto_4d5

    :cond_4e5
    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 7

    .line 187
    iget-object v0, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    const/4 v1, 0x0

    iput v1, v0, Lb/f/a/b/p;->j:F

    .line 188
    iput v1, v0, Lb/f/a/b/p;->k:F

    .line 189
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lb/f/a/b/p;->a(FFFF)V

    .line 190
    iget-object v0, p0, Lb/f/a/b/n;->f:Lb/f/a/b/m;

    invoke-virtual {v0, p1}, Lb/f/a/b/m;->b(Landroid/view/View;)V

    return-void
.end method

.method public a(Lb/f/a/b/c;)V
    .registers 3

    .line 41
    iget-object v0, p0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lb/f/a/b/p;)V
    .registers 5

    .line 37
    iget-object v0, p0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_25

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " KeyPath positon \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Lb/f/a/b/p;->k:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "\" outside of range"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MotionController"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :cond_25
    iget-object v1, p0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    neg-int v0, v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public a(Lb/f/b/k/e;Lb/f/c/c;)V
    .registers 8

    .line 191
    iget-object v0, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Lb/f/a/b/p;->j:F

    .line 192
    iput v1, v0, Lb/f/a/b/p;->k:F

    .line 193
    invoke-virtual {p0, v0}, Lb/f/a/b/n;->b(Lb/f/a/b/p;)V

    .line 194
    iget-object v0, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    invoke-virtual {p1}, Lb/f/b/k/e;->B()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lb/f/b/k/e;->C()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lb/f/a/b/p;->a(FFFF)V

    .line 195
    iget-object v0, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v1, p0, Lb/f/a/b/n;->b:I

    invoke-virtual {p2, v1}, Lb/f/c/c;->d(I)Lb/f/c/c$a;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/f/a/b/p;->a(Lb/f/c/c$a;)V

    .line 196
    iget-object v0, p0, Lb/f/a/b/n;->g:Lb/f/a/b/m;

    iget v1, p0, Lb/f/a/b/n;->b:I

    invoke-virtual {v0, p1, p2, v1}, Lb/f/a/b/m;->a(Lb/f/b/k/e;Lb/f/c/c;I)V

    return-void
.end method

.method public a(Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/f/a/b/c;",
            ">;)V"
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lb/f/a/b/n;->v:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public a([FI)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    add-int/lit8 v3, v2, -0x1

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    div-float v3, v4, v3

    .line 2
    iget-object v5, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const-string v6, "translationX"

    const/4 v7, 0x0

    if-nez v5, :cond_16

    move-object v5, v7

    goto :goto_1c

    :cond_16
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/a/b/r;

    .line 3
    :goto_1c
    iget-object v8, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    const-string v9, "translationY"

    if-nez v8, :cond_24

    move-object v8, v7

    goto :goto_2a

    :cond_24
    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/f/a/b/r;

    .line 4
    :goto_2a
    iget-object v10, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-nez v10, :cond_30

    move-object v6, v7

    goto :goto_36

    :cond_30
    invoke-virtual {v10, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb/f/a/b/g;

    .line 5
    :goto_36
    iget-object v10, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-nez v10, :cond_3b

    goto :goto_41

    :cond_3b
    invoke-virtual {v10, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/f/a/b/g;

    :goto_41
    const/4 v10, 0x0

    :goto_42
    if-ge v10, v2, :cond_114

    int-to-float v11, v10

    mul-float v11, v11, v3

    .line 6
    iget v12, v0, Lb/f/a/b/n;->l:F

    const/4 v13, 0x0

    cmpl-float v12, v12, v4

    if-eqz v12, :cond_67

    .line 7
    iget v12, v0, Lb/f/a/b/n;->k:F

    cmpg-float v12, v11, v12

    if-gez v12, :cond_55

    const/4 v11, 0x0

    .line 8
    :cond_55
    iget v12, v0, Lb/f/a/b/n;->k:F

    cmpl-float v14, v11, v12

    if-lez v14, :cond_67

    float-to-double v14, v11

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    cmpg-double v18, v14, v16

    if-gez v18, :cond_67

    sub-float/2addr v11, v12

    .line 9
    iget v12, v0, Lb/f/a/b/n;->l:F

    mul-float v11, v11, v12

    :cond_67
    float-to-double v14, v11

    .line 10
    iget-object v12, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v12, v12, Lb/f/a/b/p;->h:Lb/f/a/a/c;

    const/high16 v16, 0x7fc00000    # Float.NaN

    .line 11
    iget-object v4, v0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_74
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_9f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v9, v18

    check-cast v9, Lb/f/a/b/p;

    .line 12
    iget-object v2, v9, Lb/f/a/b/p;->h:Lb/f/a/a/c;

    if-eqz v2, :cond_9c

    move-object/from16 v18, v2

    .line 13
    iget v2, v9, Lb/f/a/b/p;->j:F

    cmpg-float v19, v2, v11

    if-gez v19, :cond_92

    move v13, v2

    move-object/from16 v12, v18

    goto :goto_9c

    .line 14
    :cond_92
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_9c

    .line 15
    iget v2, v9, Lb/f/a/b/p;->j:F

    move/from16 v16, v2

    :cond_9c
    :goto_9c
    move/from16 v2, p2

    goto :goto_74

    :cond_9f
    if-eqz v12, :cond_b9

    .line 16
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_a9

    const/high16 v16, 0x3f800000    # 1.0f

    :cond_a9
    sub-float v2, v11, v13

    sub-float v16, v16, v13

    div-float v2, v2, v16

    float-to-double v14, v2

    .line 17
    invoke-virtual {v12, v14, v15}, Lb/f/a/a/c;->a(D)D

    move-result-wide v14

    double-to-float v2, v14

    mul-float v2, v2, v16

    add-float/2addr v2, v13

    float-to-double v14, v2

    .line 18
    :cond_b9
    iget-object v2, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    const/4 v4, 0x0

    aget-object v2, v2, v4

    iget-object v9, v0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v2, v14, v15, v9}, Lb/f/a/a/b;->a(D[D)V

    .line 19
    iget-object v2, v0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    if-eqz v2, :cond_cf

    .line 20
    iget-object v9, v0, Lb/f/a/b/n;->n:[D

    array-length v12, v9

    if-lez v12, :cond_cf

    .line 21
    invoke-virtual {v2, v14, v15, v9}, Lb/f/a/a/b;->a(D[D)V

    .line 22
    :cond_cf
    iget-object v2, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v9, v0, Lb/f/a/b/n;->m:[I

    iget-object v12, v0, Lb/f/a/b/n;->n:[D

    mul-int/lit8 v13, v10, 0x2

    invoke-virtual {v2, v9, v12, v1, v13}, Lb/f/a/b/p;->a([I[D[FI)V

    if-eqz v6, :cond_e6

    .line 23
    aget v2, v1, v13

    invoke-virtual {v6, v11}, Lb/f/a/b/g;->a(F)F

    move-result v9

    add-float/2addr v2, v9

    aput v2, v1, v13

    goto :goto_f1

    :cond_e6
    if-eqz v5, :cond_f1

    .line 24
    aget v2, v1, v13

    invoke-virtual {v5, v11}, Lb/f/a/b/r;->a(F)F

    move-result v9

    add-float/2addr v2, v9

    aput v2, v1, v13

    :cond_f1
    :goto_f1
    if-eqz v7, :cond_ff

    add-int/lit8 v13, v13, 0x1

    .line 25
    aget v2, v1, v13

    invoke-virtual {v7, v11}, Lb/f/a/b/g;->a(F)F

    move-result v9

    add-float/2addr v2, v9

    aput v2, v1, v13

    goto :goto_10c

    :cond_ff
    if-eqz v8, :cond_10c

    add-int/lit8 v13, v13, 0x1

    .line 26
    aget v2, v1, v13

    invoke-virtual {v8, v11}, Lb/f/a/b/r;->a(F)F

    move-result v9

    add-float/2addr v2, v9

    aput v2, v1, v13

    :cond_10c
    :goto_10c
    add-int/lit8 v10, v10, 0x1

    move/from16 v2, p2

    const/high16 v4, 0x3f800000    # 1.0f

    goto/16 :goto_42

    :cond_114
    return-void
.end method

.method public a(Landroid/view/View;FJLb/f/a/b/e;)Z
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v11, p1

    const/4 v1, 0x0

    move/from16 v2, p2

    .line 211
    invoke-virtual {v0, v2, v1}, Lb/f/a/b/n;->a(F[F)F

    move-result v12

    .line 212
    iget-object v2, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    if-eqz v2, :cond_27

    .line 213
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/a/b/r;

    .line 214
    invoke-virtual {v3, v11, v12}, Lb/f/a/b/r;->a(Landroid/view/View;F)V

    goto :goto_17

    .line 215
    :cond_27
    iget-object v2, v0, Lb/f/a/b/n;->w:Ljava/util/HashMap;

    const/4 v13, 0x0

    if-eqz v2, :cond_59

    .line 216
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object v8, v1

    const/4 v9, 0x0

    :goto_36
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_57

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/s;

    .line 217
    instance-of v2, v1, Lb/f/a/b/s$d;

    if-eqz v2, :cond_4a

    .line 218
    move-object v8, v1

    check-cast v8, Lb/f/a/b/s$d;

    goto :goto_36

    :cond_4a
    move-object/from16 v2, p1

    move v3, v12

    move-wide/from16 v4, p3

    move-object/from16 v6, p5

    .line 219
    invoke-virtual/range {v1 .. v6}, Lb/f/a/b/s;->a(Landroid/view/View;FJLb/f/a/b/e;)Z

    move-result v1

    or-int/2addr v9, v1

    goto :goto_36

    :cond_57
    move v14, v9

    goto :goto_5b

    :cond_59
    move-object v8, v1

    const/4 v14, 0x0

    .line 220
    :goto_5b
    iget-object v1, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    const/4 v15, 0x1

    if-eqz v1, :cond_13f

    .line 221
    aget-object v1, v1, v13

    float-to-double v9, v12

    iget-object v2, v0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v1, v9, v10, v2}, Lb/f/a/a/b;->a(D[D)V

    .line 222
    iget-object v1, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    aget-object v1, v1, v13

    iget-object v2, v0, Lb/f/a/b/n;->o:[D

    invoke-virtual {v1, v9, v10, v2}, Lb/f/a/a/b;->b(D[D)V

    .line 223
    iget-object v1, v0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    if-eqz v1, :cond_84

    .line 224
    iget-object v2, v0, Lb/f/a/b/n;->n:[D

    array-length v3, v2

    if-lez v3, :cond_84

    .line 225
    invoke-virtual {v1, v9, v10, v2}, Lb/f/a/a/b;->a(D[D)V

    .line 226
    iget-object v1, v0, Lb/f/a/b/n;->i:Lb/f/a/a/b;

    iget-object v2, v0, Lb/f/a/b/n;->o:[D

    invoke-virtual {v1, v9, v10, v2}, Lb/f/a/a/b;->b(D[D)V

    .line 227
    :cond_84
    iget-object v1, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v3, v0, Lb/f/a/b/n;->m:[I

    iget-object v4, v0, Lb/f/a/b/n;->n:[D

    iget-object v5, v0, Lb/f/a/b/n;->o:[D

    const/4 v6, 0x0

    move-object/from16 v2, p1

    invoke-virtual/range {v1 .. v6}, Lb/f/a/b/p;->a(Landroid/view/View;[I[D[D[D)V

    .line 228
    iget-object v1, v0, Lb/f/a/b/n;->x:Ljava/util/HashMap;

    if-eqz v1, :cond_bd

    .line 229
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_9e
    :goto_9e
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_bd

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/r;

    .line 230
    instance-of v2, v1, Lb/f/a/b/r$d;

    if-eqz v2, :cond_9e

    .line 231
    check-cast v1, Lb/f/a/b/r$d;

    iget-object v2, v0, Lb/f/a/b/n;->o:[D

    aget-wide v4, v2, v13

    aget-wide v6, v2, v15

    move-object/from16 v2, p1

    move v3, v12

    invoke-virtual/range {v1 .. v7}, Lb/f/a/b/r$d;->a(Landroid/view/View;FDD)V

    goto :goto_9e

    :cond_bd
    if-eqz v8, :cond_da

    .line 232
    iget-object v1, v0, Lb/f/a/b/n;->o:[D

    aget-wide v16, v1, v13

    aget-wide v18, v1, v15

    move-object v1, v8

    move-object/from16 v2, p1

    move-object/from16 v3, p5

    move v4, v12

    move-wide/from16 v5, p3

    move-wide/from16 v7, v16

    move-wide/from16 v20, v9

    move-wide/from16 v9, v18

    invoke-virtual/range {v1 .. v10}, Lb/f/a/b/s$d;->a(Landroid/view/View;Lb/f/a/b/e;FJDD)Z

    move-result v1

    or-int/2addr v1, v14

    move v14, v1

    goto :goto_dc

    :cond_da
    move-wide/from16 v20, v9

    :goto_dc
    const/4 v1, 0x1

    .line 233
    :goto_dd
    iget-object v2, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    array-length v3, v2

    if-ge v1, v3, :cond_103

    .line 234
    aget-object v2, v2, v1

    .line 235
    iget-object v3, v0, Lb/f/a/b/n;->s:[F

    move-wide/from16 v4, v20

    invoke-virtual {v2, v4, v5, v3}, Lb/f/a/a/b;->a(D[F)V

    .line 236
    iget-object v2, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v2, v2, Lb/f/a/b/p;->r:Ljava/util/LinkedHashMap;

    iget-object v3, v0, Lb/f/a/b/n;->p:[Ljava/lang/String;

    add-int/lit8 v6, v1, -0x1

    aget-object v3, v3, v6

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/c/a;

    iget-object v3, v0, Lb/f/a/b/n;->s:[F

    invoke-virtual {v2, v11, v3}, Lb/f/c/a;->a(Landroid/view/View;[F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_dd

    .line 237
    :cond_103
    iget-object v1, v0, Lb/f/a/b/n;->f:Lb/f/a/b/m;

    iget v2, v1, Lb/f/a/b/m;->i:I

    if-nez v2, :cond_12d

    const/4 v2, 0x0

    cmpg-float v2, v12, v2

    if-gtz v2, :cond_114

    .line 238
    iget v1, v1, Lb/f/a/b/m;->j:I

    invoke-virtual {v11, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_12d

    :cond_114
    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, v12, v2

    if-ltz v2, :cond_122

    .line 239
    iget-object v1, v0, Lb/f/a/b/n;->g:Lb/f/a/b/m;

    iget v1, v1, Lb/f/a/b/m;->j:I

    invoke-virtual {v11, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_12d

    .line 240
    :cond_122
    iget-object v2, v0, Lb/f/a/b/n;->g:Lb/f/a/b/m;

    iget v2, v2, Lb/f/a/b/m;->j:I

    iget v1, v1, Lb/f/a/b/m;->j:I

    if-eq v2, v1, :cond_12d

    .line 241
    invoke-virtual {v11, v13}, Landroid/view/View;->setVisibility(I)V

    .line 242
    :cond_12d
    :goto_12d
    iget-object v1, v0, Lb/f/a/b/n;->z:[Lb/f/a/b/l;

    if-eqz v1, :cond_18b

    const/4 v1, 0x0

    .line 243
    :goto_132
    iget-object v2, v0, Lb/f/a/b/n;->z:[Lb/f/a/b/l;

    array-length v3, v2

    if-ge v1, v3, :cond_18b

    .line 244
    aget-object v2, v2, v1

    invoke-virtual {v2, v12, v11}, Lb/f/a/b/l;->a(FLandroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_132

    .line 245
    :cond_13f
    iget-object v1, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget v2, v1, Lb/f/a/b/p;->l:F

    iget-object v3, v0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v4, v3, Lb/f/a/b/p;->l:F

    sub-float/2addr v4, v2

    mul-float v4, v4, v12

    add-float/2addr v2, v4

    .line 246
    iget v4, v1, Lb/f/a/b/p;->m:F

    iget v5, v3, Lb/f/a/b/p;->m:F

    sub-float/2addr v5, v4

    mul-float v5, v5, v12

    add-float/2addr v4, v5

    .line 247
    iget v5, v1, Lb/f/a/b/p;->n:F

    iget v6, v3, Lb/f/a/b/p;->n:F

    sub-float v7, v6, v5

    mul-float v7, v7, v12

    add-float/2addr v7, v5

    .line 248
    iget v1, v1, Lb/f/a/b/p;->o:F

    iget v3, v3, Lb/f/a/b/p;->o:F

    sub-float v8, v3, v1

    mul-float v8, v8, v12

    add-float/2addr v8, v1

    const/high16 v9, 0x3f000000    # 0.5f

    add-float/2addr v2, v9

    float-to-int v10, v2

    add-float/2addr v4, v9

    float-to-int v9, v4

    add-float/2addr v2, v7

    float-to-int v2, v2

    add-float/2addr v4, v8

    float-to-int v4, v4

    sub-int v7, v2, v10

    sub-int v8, v4, v9

    cmpl-float v5, v6, v5

    if-nez v5, :cond_17b

    cmpl-float v1, v3, v1

    if-eqz v1, :cond_188

    :cond_17b
    const/high16 v1, 0x40000000    # 2.0f

    .line 249
    invoke-static {v7, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 250
    invoke-static {v8, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 251
    invoke-virtual {v11, v3, v1}, Landroid/view/View;->measure(II)V

    .line 252
    :cond_188
    invoke-virtual {v11, v10, v9, v2, v4}, Landroid/view/View;->layout(IIII)V

    .line 253
    :cond_18b
    iget-object v1, v0, Lb/f/a/b/n;->y:Ljava/util/HashMap;

    if-eqz v1, :cond_1ba

    .line 254
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_197
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1ba

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/a/b/g;

    .line 255
    instance-of v2, v1, Lb/f/a/b/g$f;

    if-eqz v2, :cond_1b6

    .line 256
    check-cast v1, Lb/f/a/b/g$f;

    iget-object v2, v0, Lb/f/a/b/n;->o:[D

    aget-wide v4, v2, v13

    aget-wide v6, v2, v15

    move-object/from16 v2, p1

    move v3, v12

    invoke-virtual/range {v1 .. v7}, Lb/f/a/b/g$f;->a(Landroid/view/View;FDD)V

    goto :goto_197

    .line 257
    :cond_1b6
    invoke-virtual {v1, v11, v12}, Lb/f/a/b/g;->a(Landroid/view/View;F)V

    goto :goto_197

    :cond_1ba
    return v14
.end method

.method public b()F
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v0, v0, Lb/f/a/b/p;->l:F

    return v0
.end method

.method public b(I)V
    .registers 2

    .line 2
    iput p1, p0, Lb/f/a/b/n;->A:I

    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 3

    .line 4
    iput-object p1, p0, Lb/f/a/b/n;->a:Landroid/view/View;

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iput v0, p0, Lb/f/a/b/n;->b:I

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 7
    instance-of v0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    if-eqz v0, :cond_15

    .line 8
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->a()Ljava/lang/String;

    :cond_15
    return-void
.end method

.method public final b(Lb/f/a/b/p;)V
    .registers 6

    .line 3
    iget-object v0, p0, Lb/f/a/b/n;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getX()F

    move-result v0

    float-to-int v0, v0

    int-to-float v0, v0

    iget-object v1, p0, Lb/f/a/b/n;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getY()F

    move-result v1

    float-to-int v1, v1

    int-to-float v1, v1

    iget-object v2, p0, Lb/f/a/b/n;->a:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lb/f/a/b/n;->a:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1, v0, v1, v2, v3}, Lb/f/a/b/p;->a(FFFF)V

    return-void
.end method

.method public b(Lb/f/b/k/e;Lb/f/c/c;)V
    .registers 8

    .line 9
    iget-object v0, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    const/4 v1, 0x0

    iput v1, v0, Lb/f/a/b/p;->j:F

    .line 10
    iput v1, v0, Lb/f/a/b/p;->k:F

    .line 11
    invoke-virtual {p0, v0}, Lb/f/a/b/n;->b(Lb/f/a/b/p;)V

    .line 12
    iget-object v0, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    invoke-virtual {p1}, Lb/f/b/k/e;->B()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lb/f/b/k/e;->C()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Lb/f/b/k/e;->A()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Lb/f/b/k/e;->k()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lb/f/a/b/p;->a(FFFF)V

    .line 13
    iget v0, p0, Lb/f/a/b/n;->b:I

    invoke-virtual {p2, v0}, Lb/f/c/c;->d(I)Lb/f/c/c$a;

    move-result-object v0

    .line 14
    iget-object v1, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    invoke-virtual {v1, v0}, Lb/f/a/b/p;->a(Lb/f/c/c$a;)V

    .line 15
    iget-object v0, v0, Lb/f/c/c$a;->c:Lb/f/c/c$c;

    iget v0, v0, Lb/f/c/c$c;->f:F

    iput v0, p0, Lb/f/a/b/n;->j:F

    .line 16
    iget-object v0, p0, Lb/f/a/b/n;->f:Lb/f/a/b/m;

    iget v1, p0, Lb/f/a/b/n;->b:I

    invoke-virtual {v0, p1, p2, v1}, Lb/f/a/b/m;->a(Lb/f/b/k/e;Lb/f/c/c;I)V

    return-void
.end method

.method public c()F
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v0, v0, Lb/f/a/b/p;->m:F

    return v0
.end method

.method public final d()F
    .registers 22

    move-object/from16 v0, p0

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/16 v2, 0x63

    int-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    div-float v2, v3, v2

    const-wide/16 v4, 0x0

    move-wide v8, v4

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_11
    const/16 v12, 0x64

    if-ge v10, v12, :cond_a2

    int-to-float v12, v10

    mul-float v12, v12, v2

    float-to-double v13, v12

    .line 1
    iget-object v15, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v15, v15, Lb/f/a/b/p;->h:Lb/f/a/a/c;

    const/high16 v16, 0x7fc00000    # Float.NaN

    .line 2
    iget-object v3, v0, Lb/f/a/b/n;->t:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/16 v17, 0x0

    :goto_27
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_52

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v6, v18

    check-cast v6, Lb/f/a/b/p;

    .line 3
    iget-object v7, v6, Lb/f/a/b/p;->h:Lb/f/a/a/c;

    move/from16 v19, v2

    if-eqz v7, :cond_4f

    .line 4
    iget v2, v6, Lb/f/a/b/p;->j:F

    cmpg-float v20, v2, v12

    if-gez v20, :cond_45

    move/from16 v17, v2

    move-object v15, v7

    goto :goto_4f

    .line 5
    :cond_45
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 6
    iget v2, v6, Lb/f/a/b/p;->j:F

    move/from16 v16, v2

    :cond_4f
    :goto_4f
    move/from16 v2, v19

    goto :goto_27

    :cond_52
    move/from16 v19, v2

    if-eqz v15, :cond_6f

    .line 7
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_5e

    const/high16 v16, 0x3f800000    # 1.0f

    :cond_5e
    sub-float v12, v12, v17

    sub-float v16, v16, v17

    div-float v12, v12, v16

    float-to-double v2, v12

    .line 8
    invoke-virtual {v15, v2, v3}, Lb/f/a/a/c;->a(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float v2, v2, v16

    add-float v2, v2, v17

    float-to-double v13, v2

    .line 9
    :cond_6f
    iget-object v2, v0, Lb/f/a/b/n;->h:[Lb/f/a/a/b;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget-object v6, v0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v2, v13, v14, v6}, Lb/f/a/a/b;->a(D[D)V

    .line 10
    iget-object v2, v0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget-object v6, v0, Lb/f/a/b/n;->m:[I

    iget-object v7, v0, Lb/f/a/b/n;->n:[D

    invoke-virtual {v2, v6, v7, v1, v3}, Lb/f/a/b/p;->a([I[D[FI)V

    const/4 v2, 0x1

    if-lez v10, :cond_94

    float-to-double v6, v11

    .line 11
    aget v11, v1, v2

    float-to-double v11, v11

    sub-double/2addr v8, v11

    aget v11, v1, v3

    float-to-double v11, v11

    sub-double/2addr v4, v11

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    add-double/2addr v6, v4

    double-to-float v11, v6

    .line 12
    :cond_94
    aget v4, v1, v3

    float-to-double v4, v4

    .line 13
    aget v2, v1, v2

    float-to-double v8, v2

    add-int/lit8 v10, v10, 0x1

    move/from16 v2, v19

    const/high16 v3, 0x3f800000    # 1.0f

    goto/16 :goto_11

    :cond_a2
    return v11
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " start: x: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget v1, v1, Lb/f/a/b/p;->l:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " y: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/f/a/b/n;->d:Lb/f/a/b/p;

    iget v2, v2, Lb/f/a/b/p;->m:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " end: x: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v2, v2, Lb/f/a/b/p;->l:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/a/b/n;->e:Lb/f/a/b/p;

    iget v1, v1, Lb/f/a/b/p;->m:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
