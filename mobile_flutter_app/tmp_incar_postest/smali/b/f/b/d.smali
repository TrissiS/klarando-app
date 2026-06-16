.class public Lb/f/b/d;
.super Ljava/lang/Object;
.source "LinearSystem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/d$a;,
        Lb/f/b/d$b;
    }
.end annotation


# static fields
.field public static q:I = 0x3e8

.field public static r:Lb/f/b/e; = null

.field public static s:Z = true

.field public static t:J

.field public static u:J


# instance fields
.field public a:I

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lb/f/b/i;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lb/f/b/d$a;

.field public d:I

.field public e:I

.field public f:[Lb/f/b/b;

.field public g:Z

.field public h:Z

.field public i:[Z

.field public j:I

.field public k:I

.field public l:I

.field public final m:Lb/f/b/c;

.field public n:[Lb/f/b/i;

.field public o:I

.field public p:Lb/f/b/d$a;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/f/b/d;->a:I

    const/4 v1, 0x0

    .line 3
    iput-object v1, p0, Lb/f/b/d;->b:Ljava/util/HashMap;

    const/16 v2, 0x20

    .line 4
    iput v2, p0, Lb/f/b/d;->d:I

    .line 5
    iput v2, p0, Lb/f/b/d;->e:I

    .line 6
    iput-object v1, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    .line 7
    iput-boolean v0, p0, Lb/f/b/d;->g:Z

    .line 8
    iput-boolean v0, p0, Lb/f/b/d;->h:Z

    new-array v1, v2, [Z

    .line 9
    iput-object v1, p0, Lb/f/b/d;->i:[Z

    const/4 v1, 0x1

    .line 10
    iput v1, p0, Lb/f/b/d;->j:I

    .line 11
    iput v0, p0, Lb/f/b/d;->k:I

    .line 12
    iput v2, p0, Lb/f/b/d;->l:I

    .line 13
    sget v1, Lb/f/b/d;->q:I

    new-array v1, v1, [Lb/f/b/i;

    iput-object v1, p0, Lb/f/b/d;->n:[Lb/f/b/i;

    .line 14
    iput v0, p0, Lb/f/b/d;->o:I

    new-array v0, v2, [Lb/f/b/b;

    .line 15
    iput-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    .line 16
    invoke-virtual {p0}, Lb/f/b/d;->h()V

    .line 17
    new-instance v0, Lb/f/b/c;

    invoke-direct {v0}, Lb/f/b/c;-><init>()V

    iput-object v0, p0, Lb/f/b/d;->m:Lb/f/b/c;

    .line 18
    new-instance v1, Lb/f/b/h;

    invoke-direct {v1, v0}, Lb/f/b/h;-><init>(Lb/f/b/c;)V

    iput-object v1, p0, Lb/f/b/d;->c:Lb/f/b/d$a;

    .line 19
    sget-boolean v0, Lb/f/b/d;->s:Z

    if-eqz v0, :cond_4b

    .line 20
    new-instance v0, Lb/f/b/d$b;

    iget-object v1, p0, Lb/f/b/d;->m:Lb/f/b/c;

    invoke-direct {v0, p0, v1}, Lb/f/b/d$b;-><init>(Lb/f/b/d;Lb/f/b/c;)V

    iput-object v0, p0, Lb/f/b/d;->p:Lb/f/b/d$a;

    goto :goto_54

    .line 21
    :cond_4b
    new-instance v0, Lb/f/b/b;

    iget-object v1, p0, Lb/f/b/d;->m:Lb/f/b/c;

    invoke-direct {v0, v1}, Lb/f/b/b;-><init>(Lb/f/b/c;)V

    iput-object v0, p0, Lb/f/b/d;->p:Lb/f/b/d$a;

    :goto_54
    return-void
.end method

.method public static a(Lb/f/b/d;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;
    .registers 4

    .line 151
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object p0

    .line 152
    invoke-virtual {p0, p1, p2, p3}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;

    return-object p0
.end method

.method public static j()Lb/f/b/e;
    .registers 1

    .line 1
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    return-object v0
.end method


# virtual methods
.method public final a(Lb/f/b/d$a;)I
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p0

    const/4 v2, 0x0

    .line 91
    :goto_3
    iget v3, v0, Lb/f/b/d;->k:I

    const/4 v4, 0x0

    if-ge v2, v3, :cond_22

    .line 92
    iget-object v3, v0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v6, v3, v2

    iget-object v6, v6, Lb/f/b/b;->a:Lb/f/b/i;

    .line 93
    iget-object v6, v6, Lb/f/b/i;->j:Lb/f/b/i$a;

    sget-object v7, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    if-ne v6, v7, :cond_15

    goto :goto_1f

    .line 94
    :cond_15
    aget-object v3, v3, v2

    iget v3, v3, Lb/f/b/b;->b:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1f

    const/4 v2, 0x1

    goto :goto_23

    :cond_1f
    :goto_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_22
    const/4 v2, 0x0

    :goto_23
    if-eqz v2, :cond_c8

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_27
    if-nez v2, :cond_c6

    .line 95
    sget-object v6, Lb/f/b/d;->r:Lb/f/b/e;

    const-wide/16 v7, 0x1

    if-eqz v6, :cond_34

    .line 96
    iget-wide v9, v6, Lb/f/b/e;->k:J

    add-long/2addr v9, v7

    iput-wide v9, v6, Lb/f/b/e;->k:J

    :cond_34
    add-int/lit8 v3, v3, 0x1

    const v6, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v9, -0x1

    const/4 v10, 0x0

    const/4 v11, -0x1

    const/4 v12, -0x1

    const/4 v13, 0x0

    .line 97
    :goto_3e
    iget v14, v0, Lb/f/b/d;->k:I

    if-ge v10, v14, :cond_95

    .line 98
    iget-object v14, v0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v14, v14, v10

    .line 99
    iget-object v15, v14, Lb/f/b/b;->a:Lb/f/b/i;

    .line 100
    iget-object v15, v15, Lb/f/b/i;->j:Lb/f/b/i$a;

    sget-object v1, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    if-ne v15, v1, :cond_4f

    goto :goto_8f

    .line 101
    :cond_4f
    iget-boolean v1, v14, Lb/f/b/b;->f:Z

    if-eqz v1, :cond_54

    goto :goto_8f

    .line 102
    :cond_54
    iget v1, v14, Lb/f/b/b;->b:F

    cmpg-float v1, v1, v4

    if-gez v1, :cond_8f

    const/4 v1, 0x1

    .line 103
    :goto_5b
    iget v15, v0, Lb/f/b/d;->j:I

    if-ge v1, v15, :cond_8f

    .line 104
    iget-object v15, v0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v15, v15, Lb/f/b/c;->d:[Lb/f/b/i;

    aget-object v15, v15, v1

    .line 105
    iget-object v5, v14, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v5, v15}, Lb/f/b/b$a;->a(Lb/f/b/i;)F

    move-result v5

    cmpg-float v16, v5, v4

    if-gtz v16, :cond_70

    goto :goto_89

    :cond_70
    const/4 v4, 0x0

    :goto_71
    const/16 v7, 0x9

    if-ge v4, v7, :cond_89

    .line 106
    iget-object v7, v15, Lb/f/b/i;->h:[F

    aget v7, v7, v4

    div-float/2addr v7, v5

    cmpg-float v8, v7, v6

    if-gez v8, :cond_80

    if-eq v4, v13, :cond_82

    :cond_80
    if-le v4, v13, :cond_86

    :cond_82
    move v12, v1

    move v13, v4

    move v6, v7

    move v11, v10

    :cond_86
    add-int/lit8 v4, v4, 0x1

    goto :goto_71

    :cond_89
    :goto_89
    add-int/lit8 v1, v1, 0x1

    const/4 v4, 0x0

    const-wide/16 v7, 0x1

    goto :goto_5b

    :cond_8f
    :goto_8f
    add-int/lit8 v10, v10, 0x1

    const/4 v4, 0x0

    const-wide/16 v7, 0x1

    goto :goto_3e

    :cond_95
    if-eq v11, v9, :cond_bb

    .line 107
    iget-object v1, v0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v1, v1, v11

    .line 108
    iget-object v4, v1, Lb/f/b/b;->a:Lb/f/b/i;

    iput v9, v4, Lb/f/b/i;->d:I

    .line 109
    sget-object v4, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v4, :cond_aa

    .line 110
    iget-wide v5, v4, Lb/f/b/e;->j:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, v4, Lb/f/b/e;->j:J

    .line 111
    :cond_aa
    iget-object v4, v0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v4, v4, Lb/f/b/c;->d:[Lb/f/b/i;

    aget-object v4, v4, v12

    invoke-virtual {v1, v4}, Lb/f/b/b;->d(Lb/f/b/i;)V

    .line 112
    iget-object v4, v1, Lb/f/b/b;->a:Lb/f/b/i;

    iput v11, v4, Lb/f/b/i;->d:I

    .line 113
    invoke-virtual {v4, v1}, Lb/f/b/i;->c(Lb/f/b/b;)V

    goto :goto_bc

    :cond_bb
    const/4 v2, 0x1

    .line 114
    :goto_bc
    iget v1, v0, Lb/f/b/d;->j:I

    div-int/lit8 v1, v1, 0x2

    if-le v3, v1, :cond_c3

    const/4 v2, 0x1

    :cond_c3
    const/4 v4, 0x0

    goto/16 :goto_27

    :cond_c6
    move v1, v3

    goto :goto_c9

    :cond_c8
    const/4 v1, 0x0

    :goto_c9
    return v1
.end method

.method public final a(Lb/f/b/d$a;Z)I
    .registers 15

    .line 64
    sget-object p2, Lb/f/b/d;->r:Lb/f/b/e;

    const-wide/16 v0, 0x1

    if-eqz p2, :cond_b

    .line 65
    iget-wide v2, p2, Lb/f/b/e;->h:J

    add-long/2addr v2, v0

    iput-wide v2, p2, Lb/f/b/e;->h:J

    :cond_b
    const/4 p2, 0x0

    const/4 v2, 0x0

    .line 66
    :goto_d
    iget v3, p0, Lb/f/b/d;->j:I

    if-ge v2, v3, :cond_18

    .line 67
    iget-object v3, p0, Lb/f/b/d;->i:[Z

    aput-boolean p2, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_18
    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_1a
    :goto_1a
    if-nez v2, :cond_b0

    .line 68
    sget-object v4, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v4, :cond_25

    .line 69
    iget-wide v5, v4, Lb/f/b/e;->i:J

    add-long/2addr v5, v0

    iput-wide v5, v4, Lb/f/b/e;->i:J

    :cond_25
    add-int/lit8 v3, v3, 0x1

    .line 70
    iget v4, p0, Lb/f/b/d;->j:I

    mul-int/lit8 v4, v4, 0x2

    if-lt v3, v4, :cond_2e

    return v3

    .line 71
    :cond_2e
    invoke-interface {p1}, Lb/f/b/d$a;->getKey()Lb/f/b/i;

    move-result-object v4

    const/4 v5, 0x1

    if-eqz v4, :cond_3f

    .line 72
    iget-object v4, p0, Lb/f/b/d;->i:[Z

    invoke-interface {p1}, Lb/f/b/d$a;->getKey()Lb/f/b/i;

    move-result-object v6

    iget v6, v6, Lb/f/b/i;->c:I

    aput-boolean v5, v4, v6

    .line 73
    :cond_3f
    iget-object v4, p0, Lb/f/b/d;->i:[Z

    invoke-interface {p1, p0, v4}, Lb/f/b/d$a;->a(Lb/f/b/d;[Z)Lb/f/b/i;

    move-result-object v4

    if-eqz v4, :cond_52

    .line 74
    iget-object v6, p0, Lb/f/b/d;->i:[Z

    iget v7, v4, Lb/f/b/i;->c:I

    aget-boolean v8, v6, v7

    if-eqz v8, :cond_50

    return v3

    .line 75
    :cond_50
    aput-boolean v5, v6, v7

    :cond_52
    if-eqz v4, :cond_ad

    const v5, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, -0x1

    .line 76
    :goto_5a
    iget v9, p0, Lb/f/b/d;->k:I

    if-ge v7, v9, :cond_8e

    .line 77
    iget-object v9, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v9, v9, v7

    .line 78
    iget-object v10, v9, Lb/f/b/b;->a:Lb/f/b/i;

    .line 79
    iget-object v10, v10, Lb/f/b/i;->j:Lb/f/b/i$a;

    sget-object v11, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    if-ne v10, v11, :cond_6b

    goto :goto_8b

    .line 80
    :cond_6b
    iget-boolean v10, v9, Lb/f/b/b;->f:Z

    if-eqz v10, :cond_70

    goto :goto_8b

    .line 81
    :cond_70
    invoke-virtual {v9, v4}, Lb/f/b/b;->b(Lb/f/b/i;)Z

    move-result v10

    if-eqz v10, :cond_8b

    .line 82
    iget-object v10, v9, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v10, v4}, Lb/f/b/b$a;->a(Lb/f/b/i;)F

    move-result v10

    const/4 v11, 0x0

    cmpg-float v11, v10, v11

    if-gez v11, :cond_8b

    .line 83
    iget v9, v9, Lb/f/b/b;->b:F

    neg-float v9, v9

    div-float/2addr v9, v10

    cmpg-float v10, v9, v5

    if-gez v10, :cond_8b

    move v8, v7

    move v5, v9

    :cond_8b
    :goto_8b
    add-int/lit8 v7, v7, 0x1

    goto :goto_5a

    :cond_8e
    if-le v8, v6, :cond_1a

    .line 84
    iget-object v5, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v5, v5, v8

    .line 85
    iget-object v7, v5, Lb/f/b/b;->a:Lb/f/b/i;

    iput v6, v7, Lb/f/b/i;->d:I

    .line 86
    sget-object v6, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v6, :cond_a1

    .line 87
    iget-wide v9, v6, Lb/f/b/e;->j:J

    add-long/2addr v9, v0

    iput-wide v9, v6, Lb/f/b/e;->j:J

    .line 88
    :cond_a1
    invoke-virtual {v5, v4}, Lb/f/b/b;->d(Lb/f/b/i;)V

    .line 89
    iget-object v4, v5, Lb/f/b/b;->a:Lb/f/b/i;

    iput v8, v4, Lb/f/b/i;->d:I

    .line 90
    invoke-virtual {v4, v5}, Lb/f/b/i;->c(Lb/f/b/b;)V

    goto/16 :goto_1a

    :cond_ad
    const/4 v2, 0x1

    goto/16 :goto_1a

    :cond_b0
    return v3
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;II)Lb/f/b/b;
    .registers 8

    const/16 v0, 0x8

    if-ne p4, v0, :cond_16

    .line 131
    iget-boolean v1, p2, Lb/f/b/i;->g:Z

    if-eqz v1, :cond_16

    iget v1, p1, Lb/f/b/i;->d:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_16

    .line 132
    iget p2, p2, Lb/f/b/i;->f:F

    int-to-float p3, p3

    add-float/2addr p2, p3

    invoke-virtual {p1, p0, p2}, Lb/f/b/i;->a(Lb/f/b/d;F)V

    const/4 p1, 0x0

    return-object p1

    .line 133
    :cond_16
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v1

    .line 134
    invoke-virtual {v1, p1, p2, p3}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;

    if-eq p4, v0, :cond_22

    .line 135
    invoke-virtual {v1, p0, p4}, Lb/f/b/b;->a(Lb/f/b/d;I)Lb/f/b/b;

    .line 136
    :cond_22
    invoke-virtual {p0, v1}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-object v1
.end method

.method public a(ILjava/lang/String;)Lb/f/b/i;
    .registers 8

    .line 17
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_b

    .line 18
    iget-wide v1, v0, Lb/f/b/e;->l:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, v0, Lb/f/b/e;->l:J

    .line 19
    :cond_b
    iget v0, p0, Lb/f/b/d;->j:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lb/f/b/d;->e:I

    if-lt v0, v1, :cond_16

    .line 20
    invoke-virtual {p0}, Lb/f/b/d;->f()V

    .line 21
    :cond_16
    sget-object v0, Lb/f/b/i$a;->ERROR:Lb/f/b/i$a;

    invoke-virtual {p0, v0, p2}, Lb/f/b/d;->a(Lb/f/b/i$a;Ljava/lang/String;)Lb/f/b/i;

    move-result-object p2

    .line 22
    iget v0, p0, Lb/f/b/d;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lb/f/b/d;->a:I

    .line 23
    iget v1, p0, Lb/f/b/d;->j:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lb/f/b/d;->j:I

    .line 24
    iput v0, p2, Lb/f/b/i;->c:I

    .line 25
    iput p1, p2, Lb/f/b/i;->e:I

    .line 26
    iget-object p1, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object p1, p1, Lb/f/b/c;->d:[Lb/f/b/i;

    aput-object p2, p1, v0

    .line 27
    iget-object p1, p0, Lb/f/b/d;->c:Lb/f/b/d$a;

    invoke-interface {p1, p2}, Lb/f/b/d$a;->a(Lb/f/b/i;)V

    return-object p2
.end method

.method public final a(Lb/f/b/i$a;Ljava/lang/String;)Lb/f/b/i;
    .registers 5

    .line 28
    iget-object v0, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v0, v0, Lb/f/b/c;->c:Lb/f/b/f;

    invoke-interface {v0}, Lb/f/b/f;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/i;

    if-nez v0, :cond_15

    .line 29
    new-instance v0, Lb/f/b/i;

    invoke-direct {v0, p1, p2}, Lb/f/b/i;-><init>(Lb/f/b/i$a;Ljava/lang/String;)V

    .line 30
    invoke-virtual {v0, p1, p2}, Lb/f/b/i;->a(Lb/f/b/i$a;Ljava/lang/String;)V

    goto :goto_1b

    .line 31
    :cond_15
    invoke-virtual {v0}, Lb/f/b/i;->a()V

    .line 32
    invoke-virtual {v0, p1, p2}, Lb/f/b/i;->a(Lb/f/b/i$a;Ljava/lang/String;)V

    .line 33
    :goto_1b
    iget p1, p0, Lb/f/b/d;->o:I

    sget p2, Lb/f/b/d;->q:I

    if-lt p1, p2, :cond_2f

    mul-int/lit8 p2, p2, 0x2

    .line 34
    sput p2, Lb/f/b/d;->q:I

    .line 35
    iget-object p1, p0, Lb/f/b/d;->n:[Lb/f/b/i;

    invoke-static {p1, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lb/f/b/i;

    iput-object p1, p0, Lb/f/b/d;->n:[Lb/f/b/i;

    .line 36
    :cond_2f
    iget-object p1, p0, Lb/f/b/d;->n:[Lb/f/b/i;

    iget p2, p0, Lb/f/b/d;->o:I

    add-int/lit8 v1, p2, 0x1

    iput v1, p0, Lb/f/b/d;->o:I

    aput-object v0, p1, p2

    return-object v0
.end method

.method public a(Ljava/lang/Object;)Lb/f/b/i;
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    .line 1
    :cond_4
    iget v1, p0, Lb/f/b/d;->j:I

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Lb/f/b/d;->e:I

    if-lt v1, v2, :cond_f

    .line 2
    invoke-virtual {p0}, Lb/f/b/d;->f()V

    .line 3
    :cond_f
    instance-of v1, p1, Lb/f/b/k/d;

    if-eqz v1, :cond_55

    .line 4
    check-cast p1, Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->d()Lb/f/b/i;

    move-result-object v0

    if-nez v0, :cond_25

    .line 5
    iget-object v0, p0, Lb/f/b/d;->m:Lb/f/b/c;

    invoke-virtual {p1, v0}, Lb/f/b/k/d;->a(Lb/f/b/c;)V

    .line 6
    invoke-virtual {p1}, Lb/f/b/k/d;->d()Lb/f/b/i;

    move-result-object p1

    move-object v0, p1

    .line 7
    :cond_25
    iget p1, v0, Lb/f/b/i;->c:I

    const/4 v1, -0x1

    if-eq p1, v1, :cond_36

    iget v2, p0, Lb/f/b/d;->a:I

    if-gt p1, v2, :cond_36

    iget-object v2, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v2, v2, Lb/f/b/c;->d:[Lb/f/b/i;

    aget-object p1, v2, p1

    if-nez p1, :cond_55

    .line 8
    :cond_36
    iget p1, v0, Lb/f/b/i;->c:I

    if-eq p1, v1, :cond_3d

    .line 9
    invoke-virtual {v0}, Lb/f/b/i;->a()V

    .line 10
    :cond_3d
    iget p1, p0, Lb/f/b/d;->a:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lb/f/b/d;->a:I

    .line 11
    iget v1, p0, Lb/f/b/d;->j:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lb/f/b/d;->j:I

    .line 12
    iput p1, v0, Lb/f/b/i;->c:I

    .line 13
    sget-object v1, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    iput-object v1, v0, Lb/f/b/i;->j:Lb/f/b/i$a;

    .line 14
    iget-object v1, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v1, v1, Lb/f/b/c;->d:[Lb/f/b/i;

    aput-object v0, v1, p1

    :cond_55
    return-object v0
.end method

.method public final a()V
    .registers 4

    const/4 v0, 0x0

    .line 115
    :goto_1
    iget v1, p0, Lb/f/b/d;->k:I

    if-ge v0, v1, :cond_12

    .line 116
    iget-object v1, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v1, v1, v0

    .line 117
    iget-object v2, v1, Lb/f/b/b;->a:Lb/f/b/i;

    iget v1, v1, Lb/f/b/b;->b:F

    iput v1, v2, Lb/f/b/i;->f:F

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_12
    return-void
.end method

.method public a(Lb/f/b/b;)V
    .registers 9

    if-nez p1, :cond_3

    return-void

    .line 37
    :cond_3
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    const-wide/16 v1, 0x1

    if-eqz v0, :cond_17

    .line 38
    iget-wide v3, v0, Lb/f/b/e;->f:J

    add-long/2addr v3, v1

    iput-wide v3, v0, Lb/f/b/e;->f:J

    .line 39
    iget-boolean v3, p1, Lb/f/b/b;->f:Z

    if-eqz v3, :cond_17

    .line 40
    iget-wide v3, v0, Lb/f/b/e;->g:J

    add-long/2addr v3, v1

    iput-wide v3, v0, Lb/f/b/e;->g:J

    .line 41
    :cond_17
    iget v0, p0, Lb/f/b/d;->k:I

    const/4 v3, 0x1

    add-int/2addr v0, v3

    iget v4, p0, Lb/f/b/d;->l:I

    if-ge v0, v4, :cond_26

    iget v0, p0, Lb/f/b/d;->j:I

    add-int/2addr v0, v3

    iget v4, p0, Lb/f/b/d;->e:I

    if-lt v0, v4, :cond_29

    .line 42
    :cond_26
    invoke-virtual {p0}, Lb/f/b/d;->f()V

    :cond_29
    const/4 v0, 0x0

    .line 43
    iget-boolean v4, p1, Lb/f/b/b;->f:Z

    if-nez v4, :cond_87

    .line 44
    invoke-virtual {p1, p0}, Lb/f/b/b;->c(Lb/f/b/d;)V

    .line 45
    invoke-virtual {p1}, Lb/f/b/b;->c()Z

    move-result v4

    if-eqz v4, :cond_38

    return-void

    .line 46
    :cond_38
    invoke-virtual {p1}, Lb/f/b/b;->a()V

    .line 47
    invoke-virtual {p1, p0}, Lb/f/b/b;->a(Lb/f/b/d;)Z

    move-result v4

    if-eqz v4, :cond_7e

    .line 48
    invoke-virtual {p0}, Lb/f/b/d;->b()Lb/f/b/i;

    move-result-object v0

    .line 49
    iput-object v0, p1, Lb/f/b/b;->a:Lb/f/b/i;

    .line 50
    invoke-virtual {p0, p1}, Lb/f/b/d;->b(Lb/f/b/b;)V

    .line 51
    iget-object v4, p0, Lb/f/b/d;->p:Lb/f/b/d$a;

    invoke-interface {v4, p1}, Lb/f/b/d$a;->a(Lb/f/b/d$a;)V

    .line 52
    iget-object v4, p0, Lb/f/b/d;->p:Lb/f/b/d$a;

    invoke-virtual {p0, v4, v3}, Lb/f/b/d;->a(Lb/f/b/d$a;Z)I

    .line 53
    iget v4, v0, Lb/f/b/i;->d:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_7f

    .line 54
    iget-object v4, p1, Lb/f/b/b;->a:Lb/f/b/i;

    if-ne v4, v0, :cond_6f

    .line 55
    invoke-virtual {p1, v0}, Lb/f/b/b;->c(Lb/f/b/i;)Lb/f/b/i;

    move-result-object v0

    if-eqz v0, :cond_6f

    .line 56
    sget-object v4, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v4, :cond_6c

    .line 57
    iget-wide v5, v4, Lb/f/b/e;->j:J

    add-long/2addr v5, v1

    iput-wide v5, v4, Lb/f/b/e;->j:J

    .line 58
    :cond_6c
    invoke-virtual {p1, v0}, Lb/f/b/b;->d(Lb/f/b/i;)V

    .line 59
    :cond_6f
    iget-boolean v0, p1, Lb/f/b/b;->f:Z

    if-nez v0, :cond_78

    .line 60
    iget-object v0, p1, Lb/f/b/b;->a:Lb/f/b/i;

    invoke-virtual {v0, p1}, Lb/f/b/i;->c(Lb/f/b/b;)V

    .line 61
    :cond_78
    iget v0, p0, Lb/f/b/d;->k:I

    sub-int/2addr v0, v3

    iput v0, p0, Lb/f/b/d;->k:I

    goto :goto_7f

    :cond_7e
    const/4 v3, 0x0

    .line 62
    :cond_7f
    :goto_7f
    invoke-virtual {p1}, Lb/f/b/b;->b()Z

    move-result v0

    if-nez v0, :cond_86

    return-void

    :cond_86
    move v0, v3

    :cond_87
    if-nez v0, :cond_8c

    .line 63
    invoke-virtual {p0, p1}, Lb/f/b/d;->b(Lb/f/b/b;)V

    :cond_8c
    return-void
.end method

.method public a(Lb/f/b/b;II)V
    .registers 5

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p3, v0}, Lb/f/b/d;->a(ILjava/lang/String;)Lb/f/b/i;

    move-result-object p3

    .line 16
    invoke-virtual {p1, p3, p2}, Lb/f/b/b;->a(Lb/f/b/i;I)Lb/f/b/b;

    return-void
.end method

.method public a(Lb/f/b/i;I)V
    .registers 5

    .line 137
    iget v0, p1, Lb/f/b/i;->d:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    int-to-float p2, p2

    .line 138
    invoke-virtual {p1, p0, p2}, Lb/f/b/i;->a(Lb/f/b/d;F)V

    return-void

    :cond_a
    if-eq v0, v1, :cond_32

    .line 139
    iget-object v1, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v0, v1, v0

    .line 140
    iget-boolean v1, v0, Lb/f/b/b;->f:Z

    if-eqz v1, :cond_18

    int-to-float p1, p2

    .line 141
    iput p1, v0, Lb/f/b/b;->b:F

    goto :goto_3c

    .line 142
    :cond_18
    iget-object v1, v0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v1}, Lb/f/b/b$a;->b()I

    move-result v1

    if-nez v1, :cond_27

    const/4 p1, 0x1

    .line 143
    iput-boolean p1, v0, Lb/f/b/b;->f:Z

    int-to-float p1, p2

    .line 144
    iput p1, v0, Lb/f/b/b;->b:F

    goto :goto_3c

    .line 145
    :cond_27
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v0

    .line 146
    invoke-virtual {v0, p1, p2}, Lb/f/b/b;->c(Lb/f/b/i;I)Lb/f/b/b;

    .line 147
    invoke-virtual {p0, v0}, Lb/f/b/d;->a(Lb/f/b/b;)V

    goto :goto_3c

    .line 148
    :cond_32
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v0

    .line 149
    invoke-virtual {v0, p1, p2}, Lb/f/b/b;->b(Lb/f/b/i;I)Lb/f/b/b;

    .line 150
    invoke-virtual {p0, v0}, Lb/f/b/d;->a(Lb/f/b/b;)V

    :goto_3c
    return-void
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;IFLb/f/b/i;Lb/f/b/i;II)V
    .registers 20

    move-object v0, p0

    move/from16 v1, p8

    .line 123
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v10

    move-object v2, v10

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move/from16 v9, p7

    .line 124
    invoke-virtual/range {v2 .. v9}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/i;IFLb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1c

    .line 125
    invoke-virtual {v10, p0, v1}, Lb/f/b/b;->a(Lb/f/b/d;I)Lb/f/b/b;

    .line 126
    :cond_1c
    invoke-virtual {p0, v10}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-void
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;IZ)V
    .registers 7

    .line 118
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object p4

    .line 119
    invoke-virtual {p0}, Lb/f/b/d;->d()Lb/f/b/i;

    move-result-object v0

    const/4 v1, 0x0

    .line 120
    iput v1, v0, Lb/f/b/i;->e:I

    .line 121
    invoke-virtual {p4, p1, p2, v0, p3}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;

    .line 122
    invoke-virtual {p0, p4}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-void
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;FI)V
    .registers 14

    .line 127
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v6

    move-object v0, v6

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    .line 128
    invoke-virtual/range {v0 .. v5}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;

    const/16 p1, 0x8

    if-eq p6, p1, :cond_14

    .line 129
    invoke-virtual {v6, p0, p6}, Lb/f/b/b;->a(Lb/f/b/d;I)Lb/f/b/b;

    .line 130
    :cond_14
    invoke-virtual {p0, v6}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-void
.end method

.method public a(Lb/f/b/k/e;Lb/f/b/k/e;FI)V
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 153
    sget-object v3, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {v1, v3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v3

    invoke-virtual {v0, v3}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v5

    .line 154
    sget-object v3, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {v1, v3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v3

    invoke-virtual {v0, v3}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v7

    .line 155
    sget-object v3, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {v1, v3}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v3

    invoke-virtual {v0, v3}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v3

    .line 156
    sget-object v4, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {v1, v4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v8

    .line 157
    sget-object v1, Lb/f/b/k/d$b;->LEFT:Lb/f/b/k/d$b;

    invoke-virtual {v2, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v1

    .line 158
    sget-object v4, Lb/f/b/k/d$b;->TOP:Lb/f/b/k/d$b;

    invoke-virtual {v2, v4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v4

    invoke-virtual {v0, v4}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v9

    .line 159
    sget-object v4, Lb/f/b/k/d$b;->RIGHT:Lb/f/b/k/d$b;

    invoke-virtual {v2, v4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v4

    invoke-virtual {v0, v4}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v12

    .line 160
    sget-object v4, Lb/f/b/k/d$b;->BOTTOM:Lb/f/b/k/d$b;

    invoke-virtual {v2, v4}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v2

    invoke-virtual {v0, v2}, Lb/f/b/d;->a(Ljava/lang/Object;)Lb/f/b/i;

    move-result-object v10

    .line 161
    invoke-virtual/range {p0 .. p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v2

    move/from16 v4, p3

    float-to-double v13, v4

    .line 162
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v15

    move/from16 v4, p4

    move-object/from16 v17, v3

    int-to-double v3, v4

    move-object/from16 p1, v12

    mul-double v11, v15, v3

    double-to-float v11, v11

    move-object v6, v2

    .line 163
    invoke-virtual/range {v6 .. v11}, Lb/f/b/b;->b(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;

    .line 164
    invoke-virtual {v0, v2}, Lb/f/b/d;->a(Lb/f/b/b;)V

    .line 165
    invoke-virtual/range {p0 .. p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v2

    .line 166
    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    mul-double v6, v6, v3

    double-to-float v9, v6

    move-object v4, v2

    move-object/from16 v6, v17

    move-object v7, v1

    move-object/from16 v8, p1

    .line 167
    invoke-virtual/range {v4 .. v9}, Lb/f/b/b;->b(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;

    .line 168
    invoke-virtual {v0, v2}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-void
.end method

.method public b(Ljava/lang/Object;)I
    .registers 3

    .line 10
    check-cast p1, Lb/f/b/k/d;

    invoke-virtual {p1}, Lb/f/b/k/d;->d()Lb/f/b/i;

    move-result-object p1

    if-eqz p1, :cond_f

    .line 11
    iget p1, p1, Lb/f/b/i;->f:F

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1

    :cond_f
    const/4 p1, 0x0

    return p1
.end method

.method public b()Lb/f/b/i;
    .registers 6

    .line 1
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_b

    .line 2
    iget-wide v1, v0, Lb/f/b/e;->n:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, v0, Lb/f/b/e;->n:J

    .line 3
    :cond_b
    iget v0, p0, Lb/f/b/d;->j:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lb/f/b/d;->e:I

    if-lt v0, v1, :cond_16

    .line 4
    invoke-virtual {p0}, Lb/f/b/d;->f()V

    .line 5
    :cond_16
    sget-object v0, Lb/f/b/i$a;->SLACK:Lb/f/b/i$a;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lb/f/b/d;->a(Lb/f/b/i$a;Ljava/lang/String;)Lb/f/b/i;

    move-result-object v0

    .line 6
    iget v1, p0, Lb/f/b/d;->a:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lb/f/b/d;->a:I

    .line 7
    iget v2, p0, Lb/f/b/d;->j:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lb/f/b/d;->j:I

    .line 8
    iput v1, v0, Lb/f/b/i;->c:I

    .line 9
    iget-object v2, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v2, v2, Lb/f/b/c;->d:[Lb/f/b/i;

    aput-object v0, v2, v1

    return-object v0
.end method

.method public final b(Lb/f/b/b;)V
    .registers 5

    .line 19
    sget-boolean v0, Lb/f/b/d;->s:Z

    if-eqz v0, :cond_16

    .line 20
    iget-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    iget v1, p0, Lb/f/b/d;->k:I

    aget-object v2, v0, v1

    if-eqz v2, :cond_27

    .line 21
    iget-object v2, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v2, v2, Lb/f/b/c;->a:Lb/f/b/f;

    aget-object v0, v0, v1

    invoke-interface {v2, v0}, Lb/f/b/f;->a(Ljava/lang/Object;)Z

    goto :goto_27

    .line 22
    :cond_16
    iget-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    iget v1, p0, Lb/f/b/d;->k:I

    aget-object v2, v0, v1

    if-eqz v2, :cond_27

    .line 23
    iget-object v2, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v2, v2, Lb/f/b/c;->b:Lb/f/b/f;

    aget-object v0, v0, v1

    invoke-interface {v2, v0}, Lb/f/b/f;->a(Ljava/lang/Object;)Z

    .line 24
    :cond_27
    :goto_27
    iget-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    iget v1, p0, Lb/f/b/d;->k:I

    aput-object p1, v0, v1

    .line 25
    iget-object v0, p1, Lb/f/b/b;->a:Lb/f/b/i;

    iput v1, v0, Lb/f/b/i;->d:I

    add-int/lit8 v1, v1, 0x1

    .line 26
    iput v1, p0, Lb/f/b/d;->k:I

    .line 27
    invoke-virtual {v0, p1}, Lb/f/b/i;->c(Lb/f/b/b;)V

    return-void
.end method

.method public b(Lb/f/b/d$a;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_23

    .line 13
    iget-wide v1, v0, Lb/f/b/e;->t:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, v0, Lb/f/b/e;->t:J

    .line 14
    iget-wide v1, v0, Lb/f/b/e;->u:J

    iget v3, p0, Lb/f/b/d;->j:I

    int-to-long v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iput-wide v1, v0, Lb/f/b/e;->u:J

    .line 15
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    iget-wide v1, v0, Lb/f/b/e;->v:J

    iget v3, p0, Lb/f/b/d;->k:I

    int-to-long v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    iput-wide v1, v0, Lb/f/b/e;->v:J

    .line 16
    :cond_23
    invoke-virtual {p0, p1}, Lb/f/b/d;->a(Lb/f/b/d$a;)I

    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, p1, v0}, Lb/f/b/d;->a(Lb/f/b/d$a;Z)I

    .line 18
    invoke-virtual {p0}, Lb/f/b/d;->a()V

    return-void
.end method

.method public b(Lb/f/b/i;Lb/f/b/i;II)V
    .registers 8

    .line 28
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v0

    .line 29
    invoke-virtual {p0}, Lb/f/b/d;->d()Lb/f/b/i;

    move-result-object v1

    const/4 v2, 0x0

    .line 30
    iput v2, v1, Lb/f/b/i;->e:I

    .line 31
    invoke-virtual {v0, p1, p2, v1, p3}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;

    const/16 p1, 0x8

    if-eq p4, p1, :cond_20

    .line 32
    iget-object p1, v0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;)F

    move-result p1

    const/high16 p2, -0x40800000    # -1.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    .line 33
    invoke-virtual {p0, v0, p1, p4}, Lb/f/b/d;->a(Lb/f/b/b;II)V

    .line 34
    :cond_20
    invoke-virtual {p0, v0}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-void
.end method

.method public b(Lb/f/b/i;Lb/f/b/i;IZ)V
    .registers 7

    .line 35
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object p4

    .line 36
    invoke-virtual {p0}, Lb/f/b/d;->d()Lb/f/b/i;

    move-result-object v0

    const/4 v1, 0x0

    .line 37
    iput v1, v0, Lb/f/b/i;->e:I

    .line 38
    invoke-virtual {p4, p1, p2, v0, p3}, Lb/f/b/b;->b(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;

    .line 39
    invoke-virtual {p0, p4}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-void
.end method

.method public c()Lb/f/b/b;
    .registers 6

    .line 1
    sget-boolean v0, Lb/f/b/d;->s:Z

    const-wide/16 v1, 0x1

    if-eqz v0, :cond_23

    .line 2
    iget-object v0, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v0, v0, Lb/f/b/c;->a:Lb/f/b/f;

    invoke-interface {v0}, Lb/f/b/f;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/b;

    if-nez v0, :cond_1f

    .line 3
    new-instance v0, Lb/f/b/d$b;

    iget-object v3, p0, Lb/f/b/d;->m:Lb/f/b/c;

    invoke-direct {v0, p0, v3}, Lb/f/b/d$b;-><init>(Lb/f/b/d;Lb/f/b/c;)V

    .line 4
    sget-wide v3, Lb/f/b/d;->u:J

    add-long/2addr v3, v1

    sput-wide v3, Lb/f/b/d;->u:J

    goto :goto_3f

    .line 5
    :cond_1f
    invoke-virtual {v0}, Lb/f/b/b;->d()V

    goto :goto_3f

    .line 6
    :cond_23
    iget-object v0, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v0, v0, Lb/f/b/c;->b:Lb/f/b/f;

    invoke-interface {v0}, Lb/f/b/f;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/b;

    if-nez v0, :cond_3c

    .line 7
    new-instance v0, Lb/f/b/b;

    iget-object v3, p0, Lb/f/b/d;->m:Lb/f/b/c;

    invoke-direct {v0, v3}, Lb/f/b/b;-><init>(Lb/f/b/c;)V

    .line 8
    sget-wide v3, Lb/f/b/d;->t:J

    add-long/2addr v3, v1

    sput-wide v3, Lb/f/b/d;->t:J

    goto :goto_3f

    .line 9
    :cond_3c
    invoke-virtual {v0}, Lb/f/b/b;->d()V

    .line 10
    :goto_3f
    invoke-static {}, Lb/f/b/i;->b()V

    return-object v0
.end method

.method public c(Lb/f/b/i;Lb/f/b/i;II)V
    .registers 8

    .line 11
    invoke-virtual {p0}, Lb/f/b/d;->c()Lb/f/b/b;

    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lb/f/b/d;->d()Lb/f/b/i;

    move-result-object v1

    const/4 v2, 0x0

    .line 13
    iput v2, v1, Lb/f/b/i;->e:I

    .line 14
    invoke-virtual {v0, p1, p2, v1, p3}, Lb/f/b/b;->b(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;

    const/16 p1, 0x8

    if-eq p4, p1, :cond_20

    .line 15
    iget-object p1, v0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;)F

    move-result p1

    const/high16 p2, -0x40800000    # -1.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    .line 16
    invoke-virtual {p0, v0, p1, p4}, Lb/f/b/d;->a(Lb/f/b/b;II)V

    .line 17
    :cond_20
    invoke-virtual {p0, v0}, Lb/f/b/d;->a(Lb/f/b/b;)V

    return-void
.end method

.method public d()Lb/f/b/i;
    .registers 6

    .line 1
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_b

    .line 2
    iget-wide v1, v0, Lb/f/b/e;->m:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, v0, Lb/f/b/e;->m:J

    .line 3
    :cond_b
    iget v0, p0, Lb/f/b/d;->j:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lb/f/b/d;->e:I

    if-lt v0, v1, :cond_16

    .line 4
    invoke-virtual {p0}, Lb/f/b/d;->f()V

    .line 5
    :cond_16
    sget-object v0, Lb/f/b/i$a;->SLACK:Lb/f/b/i$a;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lb/f/b/d;->a(Lb/f/b/i$a;Ljava/lang/String;)Lb/f/b/i;

    move-result-object v0

    .line 6
    iget v1, p0, Lb/f/b/d;->a:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lb/f/b/d;->a:I

    .line 7
    iget v2, p0, Lb/f/b/d;->j:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lb/f/b/d;->j:I

    .line 8
    iput v1, v0, Lb/f/b/i;->c:I

    .line 9
    iget-object v2, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v2, v2, Lb/f/b/c;->d:[Lb/f/b/i;

    aput-object v0, v2, v1

    return-object v0
.end method

.method public e()Lb/f/b/c;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/d;->m:Lb/f/b/c;

    return-object v0
.end method

.method public final f()V
    .registers 7

    .line 1
    iget v0, p0, Lb/f/b/d;->d:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lb/f/b/d;->d:I

    .line 2
    iget-object v1, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/b;

    iput-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    .line 3
    iget-object v0, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v1, v0, Lb/f/b/c;->d:[Lb/f/b/i;

    iget v2, p0, Lb/f/b/d;->d:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lb/f/b/i;

    iput-object v1, v0, Lb/f/b/c;->d:[Lb/f/b/i;

    .line 4
    iget v0, p0, Lb/f/b/d;->d:I

    new-array v1, v0, [Z

    iput-object v1, p0, Lb/f/b/d;->i:[Z

    .line 5
    iput v0, p0, Lb/f/b/d;->e:I

    .line 6
    iput v0, p0, Lb/f/b/d;->l:I

    .line 7
    sget-object v1, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v1, :cond_42

    .line 8
    iget-wide v2, v1, Lb/f/b/e;->d:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, v1, Lb/f/b/e;->d:J

    .line 9
    iget-wide v2, v1, Lb/f/b/e;->o:J

    int-to-long v4, v0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v1, Lb/f/b/e;->o:J

    .line 10
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    iget-wide v1, v0, Lb/f/b/e;->o:J

    iput-wide v1, v0, Lb/f/b/e;->x:J

    :cond_42
    return-void
.end method

.method public g()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    const-wide/16 v1, 0x1

    if-eqz v0, :cond_b

    .line 2
    iget-wide v3, v0, Lb/f/b/e;->e:J

    add-long/2addr v3, v1

    iput-wide v3, v0, Lb/f/b/e;->e:J

    .line 3
    :cond_b
    iget-boolean v0, p0, Lb/f/b/d;->g:Z

    if-nez v0, :cond_1a

    iget-boolean v0, p0, Lb/f/b/d;->h:Z

    if-eqz v0, :cond_14

    goto :goto_1a

    .line 4
    :cond_14
    iget-object v0, p0, Lb/f/b/d;->c:Lb/f/b/d$a;

    invoke-virtual {p0, v0}, Lb/f/b/d;->b(Lb/f/b/d$a;)V

    goto :goto_4a

    .line 5
    :cond_1a
    :goto_1a
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_23

    .line 6
    iget-wide v3, v0, Lb/f/b/e;->q:J

    add-long/2addr v3, v1

    iput-wide v3, v0, Lb/f/b/e;->q:J

    :cond_23
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 7
    :goto_25
    iget v4, p0, Lb/f/b/d;->k:I

    if-ge v3, v4, :cond_35

    .line 8
    iget-object v4, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v4, v4, v3

    .line 9
    iget-boolean v4, v4, Lb/f/b/b;->f:Z

    if-nez v4, :cond_32

    goto :goto_36

    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_25

    :cond_35
    const/4 v0, 0x1

    :goto_36
    if-nez v0, :cond_3e

    .line 10
    iget-object v0, p0, Lb/f/b/d;->c:Lb/f/b/d$a;

    invoke-virtual {p0, v0}, Lb/f/b/d;->b(Lb/f/b/d$a;)V

    goto :goto_4a

    .line 11
    :cond_3e
    sget-object v0, Lb/f/b/d;->r:Lb/f/b/e;

    if-eqz v0, :cond_47

    .line 12
    iget-wide v3, v0, Lb/f/b/e;->p:J

    add-long/2addr v3, v1

    iput-wide v3, v0, Lb/f/b/e;->p:J

    .line 13
    :cond_47
    invoke-virtual {p0}, Lb/f/b/d;->a()V

    :goto_4a
    return-void
.end method

.method public final h()V
    .registers 5

    .line 1
    sget-boolean v0, Lb/f/b/d;->s:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1d

    .line 2
    :goto_6
    iget-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    array-length v3, v0

    if-ge v2, v3, :cond_34

    .line 3
    aget-object v0, v0, v2

    if-eqz v0, :cond_16

    .line 4
    iget-object v3, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v3, v3, Lb/f/b/c;->a:Lb/f/b/f;

    invoke-interface {v3, v0}, Lb/f/b/f;->a(Ljava/lang/Object;)Z

    .line 5
    :cond_16
    iget-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aput-object v1, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 6
    :cond_1d
    :goto_1d
    iget-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    array-length v3, v0

    if-ge v2, v3, :cond_34

    .line 7
    aget-object v0, v0, v2

    if-eqz v0, :cond_2d

    .line 8
    iget-object v3, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v3, v3, Lb/f/b/c;->b:Lb/f/b/f;

    invoke-interface {v3, v0}, Lb/f/b/f;->a(Ljava/lang/Object;)Z

    .line 9
    :cond_2d
    iget-object v0, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aput-object v1, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    :cond_34
    return-void
.end method

.method public i()V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    :goto_2
    iget-object v2, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v3, v2, Lb/f/b/c;->d:[Lb/f/b/i;

    array-length v4, v3

    if-ge v1, v4, :cond_13

    .line 2
    aget-object v2, v3, v1

    if-eqz v2, :cond_10

    .line 3
    invoke-virtual {v2}, Lb/f/b/i;->a()V

    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 4
    :cond_13
    iget-object v1, v2, Lb/f/b/c;->c:Lb/f/b/f;

    iget-object v2, p0, Lb/f/b/d;->n:[Lb/f/b/i;

    iget v3, p0, Lb/f/b/d;->o:I

    invoke-interface {v1, v2, v3}, Lb/f/b/f;->a([Ljava/lang/Object;I)V

    .line 5
    iput v0, p0, Lb/f/b/d;->o:I

    .line 6
    iget-object v1, p0, Lb/f/b/d;->m:Lb/f/b/c;

    iget-object v1, v1, Lb/f/b/c;->d:[Lb/f/b/i;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 7
    iget-object v1, p0, Lb/f/b/d;->b:Ljava/util/HashMap;

    if-eqz v1, :cond_2d

    .line 8
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 9
    :cond_2d
    iput v0, p0, Lb/f/b/d;->a:I

    .line 10
    iget-object v1, p0, Lb/f/b/d;->c:Lb/f/b/d$a;

    invoke-interface {v1}, Lb/f/b/d$a;->clear()V

    const/4 v1, 0x1

    .line 11
    iput v1, p0, Lb/f/b/d;->j:I

    const/4 v1, 0x0

    .line 12
    :goto_38
    iget v2, p0, Lb/f/b/d;->k:I

    if-ge v1, v2, :cond_45

    .line 13
    iget-object v2, p0, Lb/f/b/d;->f:[Lb/f/b/b;

    aget-object v2, v2, v1

    iput-boolean v0, v2, Lb/f/b/b;->c:Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_38

    .line 14
    :cond_45
    invoke-virtual {p0}, Lb/f/b/d;->h()V

    .line 15
    iput v0, p0, Lb/f/b/d;->k:I

    .line 16
    sget-boolean v0, Lb/f/b/d;->s:Z

    if-eqz v0, :cond_58

    .line 17
    new-instance v0, Lb/f/b/d$b;

    iget-object v1, p0, Lb/f/b/d;->m:Lb/f/b/c;

    invoke-direct {v0, p0, v1}, Lb/f/b/d$b;-><init>(Lb/f/b/d;Lb/f/b/c;)V

    iput-object v0, p0, Lb/f/b/d;->p:Lb/f/b/d$a;

    goto :goto_61

    .line 18
    :cond_58
    new-instance v0, Lb/f/b/b;

    iget-object v1, p0, Lb/f/b/d;->m:Lb/f/b/c;

    invoke-direct {v0, v1}, Lb/f/b/b;-><init>(Lb/f/b/c;)V

    iput-object v0, p0, Lb/f/b/d;->p:Lb/f/b/d$a;

    :goto_61
    return-void
.end method
