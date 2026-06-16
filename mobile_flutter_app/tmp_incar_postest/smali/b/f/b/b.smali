.class public Lb/f/b/b;
.super Ljava/lang/Object;
.source "ArrayRow.java"

# interfaces
.implements Lb/f/b/d$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/b$a;
    }
.end annotation


# instance fields
.field public a:Lb/f/b/i;

.field public b:F

.field public c:Z

.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/i;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lb/f/b/b$a;

.field public f:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lb/f/b/b;->b:F

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/b;->d:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lb/f/b/b;->f:Z

    return-void
.end method

.method public constructor <init>(Lb/f/b/c;)V
    .registers 3

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lb/f/b/b;->b:F

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/b;->d:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lb/f/b/b;->f:Z

    .line 11
    new-instance v0, Lb/f/b/a;

    invoke-direct {v0, p0, p1}, Lb/f/b/a;-><init>(Lb/f/b/b;Lb/f/b/c;)V

    iput-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    return-void
.end method


# virtual methods
.method public a(FFFLb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;)Lb/f/b/b;
    .registers 12

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lb/f/b/b;->b:F

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v3, p2, v0

    if-eqz v3, :cond_47

    cmpl-float v3, p1, p3

    if-nez v3, :cond_10

    goto :goto_47

    :cond_10
    cmpl-float v3, p1, v0

    if-nez v3, :cond_1f

    .line 15
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p4, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 16
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p5, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    goto :goto_5b

    :cond_1f
    cmpl-float v0, p3, v0

    if-nez v0, :cond_2e

    .line 17
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p6, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 18
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p7, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    goto :goto_5b

    :cond_2e
    div-float/2addr p1, p2

    div-float/2addr p3, p2

    div-float/2addr p1, p3

    .line 19
    iget-object p2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p2, p4, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 20
    iget-object p2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p2, p5, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 21
    iget-object p2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p2, p7, p1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 22
    iget-object p2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    neg-float p1, p1

    invoke-interface {p2, p6, p1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    goto :goto_5b

    .line 23
    :cond_47
    :goto_47
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p4, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 24
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p5, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 25
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p7, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 26
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p6, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    :goto_5b
    return-object p0
.end method

.method public a(Lb/f/b/d;I)Lb/f/b/b;
    .registers 6

    .line 46
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const-string v1, "ep"

    invoke-virtual {p1, p2, v1}, Lb/f/b/d;->a(ILjava/lang/String;)Lb/f/b/i;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-interface {v0, v1, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 47
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const-string v1, "em"

    invoke-virtual {p1, p2, v1}, Lb/f/b/d;->a(ILjava/lang/String;)Lb/f/b/i;

    move-result-object p1

    const/high16 p2, -0x40800000    # -1.0f

    invoke-interface {v0, p1, p2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    return-object p0
.end method

.method public a(Lb/f/b/i;I)Lb/f/b/b;
    .registers 4

    .line 6
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    int-to-float p2, p2

    invoke-interface {v0, p1, p2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    return-object p0
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;
    .registers 6

    .line 48
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-interface {v0, p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 49
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, p3}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    return-object p0
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;
    .registers 6

    const/4 v0, 0x0

    if-eqz p3, :cond_b

    if-gez p3, :cond_8

    mul-int/lit8 p3, p3, -0x1

    const/4 v0, 0x1

    :cond_8
    int-to-float p3, p3

    .line 1
    iput p3, p0, Lb/f/b/b;->b:F

    :cond_b
    const/high16 p3, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    if-nez v0, :cond_1c

    .line 2
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, p3}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 3
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    goto :goto_26

    .line 4
    :cond_1c
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 5
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, p3}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    :goto_26
    return-object p0
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;IFLb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;
    .registers 13

    const/high16 v0, 0x3f800000    # 1.0f

    if-ne p2, p5, :cond_16

    .line 27
    iget-object p3, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p3, p1, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 28
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p6, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 29
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 p3, -0x40000000    # -2.0f

    invoke-interface {p1, p2, p3}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    return-object p0

    :cond_16
    const/high16 v1, 0x3f000000    # 0.5f

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v1, p4, v1

    if-nez v1, :cond_3c

    .line 30
    iget-object p4, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p4, p1, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 31
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 32
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p5, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 33
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p6, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    if-gtz p3, :cond_36

    if-lez p7, :cond_8e

    :cond_36
    neg-int p1, p3

    add-int/2addr p1, p7

    int-to-float p1, p1

    .line 34
    iput p1, p0, Lb/f/b/b;->b:F

    goto :goto_8e

    :cond_3c
    const/4 v1, 0x0

    cmpg-float v1, p4, v1

    if-gtz v1, :cond_4f

    .line 35
    iget-object p4, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p4, p1, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 36
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    int-to-float p1, p3

    .line 37
    iput p1, p0, Lb/f/b/b;->b:F

    goto :goto_8e

    :cond_4f
    cmpl-float v1, p4, v0

    if-ltz v1, :cond_62

    .line 38
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p6, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 39
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p5, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    neg-int p1, p7

    int-to-float p1, p1

    .line 40
    iput p1, p0, Lb/f/b/b;->b:F

    goto :goto_8e

    .line 41
    :cond_62
    iget-object v1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    sub-float v3, v0, p4

    mul-float v4, v3, v0

    invoke-interface {v1, p1, v4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 42
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    mul-float v1, v3, v2

    invoke-interface {p1, p2, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 43
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    mul-float v2, v2, p4

    invoke-interface {p1, p5, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 44
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    mul-float v0, v0, p4

    invoke-interface {p1, p6, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    if-gtz p3, :cond_84

    if-lez p7, :cond_8e

    :cond_84
    neg-int p1, p3

    int-to-float p1, p1

    mul-float p1, p1, v3

    int-to-float p2, p7

    mul-float p2, p2, p4

    add-float/2addr p1, p2

    .line 45
    iput p1, p0, Lb/f/b/b;->b:F

    :cond_8e
    :goto_8e
    return-object p0
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;
    .registers 7

    const/4 v0, 0x0

    if-eqz p4, :cond_b

    if-gez p4, :cond_8

    mul-int/lit8 p4, p4, -0x1

    const/4 v0, 0x1

    :cond_8
    int-to-float p4, p4

    .line 7
    iput p4, p0, Lb/f/b/b;->b:F

    :cond_b
    const/high16 p4, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    if-nez v0, :cond_21

    .line 8
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 9
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 10
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p3, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    goto :goto_30

    .line 11
    :cond_21
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 12
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 13
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p3, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    :goto_30
    return-object p0
.end method

.method public a(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;
    .registers 8

    .line 50
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-interface {v0, p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 51
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-interface {p1, p2, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 52
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p3, p5}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 53
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    neg-float p2, p5

    invoke-interface {p1, p4, p2}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    return-object p0
.end method

.method public a(Lb/f/b/d;[Z)Lb/f/b/i;
    .registers 3

    const/4 p1, 0x0

    .line 75
    invoke-virtual {p0, p2, p1}, Lb/f/b/b;->a([ZLb/f/b/i;)Lb/f/b/i;

    move-result-object p1

    return-object p1
.end method

.method public final a([ZLb/f/b/i;)Lb/f/b/i;
    .registers 12

    .line 70
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0}, Lb/f/b/b$a;->b()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_a
    if-ge v3, v0, :cond_39

    .line 71
    iget-object v5, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v5, v3}, Lb/f/b/b$a;->a(I)F

    move-result v5

    cmpg-float v6, v5, v1

    if-gez v6, :cond_36

    .line 72
    iget-object v6, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v6, v3}, Lb/f/b/b$a;->b(I)Lb/f/b/i;

    move-result-object v6

    if-eqz p1, :cond_24

    .line 73
    iget v7, v6, Lb/f/b/i;->c:I

    aget-boolean v7, p1, v7

    if-nez v7, :cond_36

    :cond_24
    if-eq v6, p2, :cond_36

    .line 74
    iget-object v7, v6, Lb/f/b/i;->j:Lb/f/b/i$a;

    sget-object v8, Lb/f/b/i$a;->SLACK:Lb/f/b/i$a;

    if-eq v7, v8, :cond_30

    sget-object v8, Lb/f/b/i$a;->ERROR:Lb/f/b/i$a;

    if-ne v7, v8, :cond_36

    :cond_30
    cmpg-float v7, v5, v4

    if-gez v7, :cond_36

    move v4, v5

    move-object v2, v6

    :cond_36
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_39
    return-object v2
.end method

.method public a()V
    .registers 3

    .line 54
    iget v0, p0, Lb/f/b/b;->b:F

    const/4 v1, 0x0

    cmpg-float v1, v0, v1

    if-gez v1, :cond_12

    const/high16 v1, -0x40800000    # -1.0f

    mul-float v0, v0, v1

    .line 55
    iput v0, p0, Lb/f/b/b;->b:F

    .line 56
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0}, Lb/f/b/b$a;->a()V

    :cond_12
    return-void
.end method

.method public a(Lb/f/b/b;Z)V
    .registers 6

    .line 62
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, p2}, Lb/f/b/b$a;->a(Lb/f/b/b;Z)F

    move-result v0

    .line 63
    iget v1, p0, Lb/f/b/b;->b:F

    iget v2, p1, Lb/f/b/b;->b:F

    mul-float v2, v2, v0

    add-float/2addr v1, v2

    iput v1, p0, Lb/f/b/b;->b:F

    if-eqz p2, :cond_16

    .line 64
    iget-object p1, p1, Lb/f/b/b;->a:Lb/f/b/i;

    invoke-virtual {p1, p0}, Lb/f/b/i;->b(Lb/f/b/b;)V

    :cond_16
    return-void
.end method

.method public a(Lb/f/b/d$a;)V
    .registers 7

    .line 76
    instance-of v0, p1, Lb/f/b/b;

    if-eqz v0, :cond_2c

    .line 77
    check-cast p1, Lb/f/b/b;

    const/4 v0, 0x0

    .line 78
    iput-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    .line 79
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0}, Lb/f/b/b$a;->clear()V

    const/4 v0, 0x0

    .line 80
    :goto_f
    iget-object v1, p1, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v1}, Lb/f/b/b$a;->b()I

    move-result v1

    if-ge v0, v1, :cond_2c

    .line 81
    iget-object v1, p1, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v1, v0}, Lb/f/b/b$a;->b(I)Lb/f/b/i;

    move-result-object v1

    .line 82
    iget-object v2, p1, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v2, v0}, Lb/f/b/b$a;->a(I)F

    move-result v2

    .line 83
    iget-object v3, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/4 v4, 0x1

    invoke-interface {v3, v1, v2, v4}, Lb/f/b/b$a;->a(Lb/f/b/i;FZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_2c
    return-void
.end method

.method public a(Lb/f/b/d;Lb/f/b/i;Z)V
    .registers 6

    .line 65
    iget-boolean p1, p2, Lb/f/b/i;->g:Z

    if-nez p1, :cond_5

    return-void

    .line 66
    :cond_5
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2}, Lb/f/b/b$a;->a(Lb/f/b/i;)F

    move-result p1

    .line 67
    iget v0, p0, Lb/f/b/b;->b:F

    iget v1, p2, Lb/f/b/i;->f:F

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lb/f/b/b;->b:F

    .line 68
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, p3}, Lb/f/b/b$a;->a(Lb/f/b/i;Z)F

    if-eqz p3, :cond_1e

    .line 69
    invoke-virtual {p2, p0}, Lb/f/b/i;->b(Lb/f/b/b;)V

    :cond_1e
    return-void
.end method

.method public a(Lb/f/b/i;)V
    .registers 5

    .line 84
    iget v0, p1, Lb/f/b/i;->e:I

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x1

    if-ne v0, v2, :cond_8

    goto :goto_22

    :cond_8
    const/4 v2, 0x2

    if-ne v0, v2, :cond_e

    const/high16 v1, 0x447a0000    # 1000.0f

    goto :goto_22

    :cond_e
    const/4 v2, 0x3

    if-ne v0, v2, :cond_15

    const v1, 0x49742400    # 1000000.0f

    goto :goto_22

    :cond_15
    const/4 v2, 0x4

    if-ne v0, v2, :cond_1c

    const v1, 0x4e6e6b28    # 1.0E9f

    goto :goto_22

    :cond_1c
    const/4 v2, 0x5

    if-ne v0, v2, :cond_22

    const v1, 0x5368d4a5    # 1.0E12f

    .line 85
    :cond_22
    :goto_22
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    return-void
.end method

.method public a(Lb/f/b/d;)Z
    .registers 4

    .line 57
    invoke-virtual {p0, p1}, Lb/f/b/b;->b(Lb/f/b/d;)Lb/f/b/i;

    move-result-object p1

    const/4 v0, 0x1

    if-nez p1, :cond_9

    const/4 p1, 0x1

    goto :goto_d

    .line 58
    :cond_9
    invoke-virtual {p0, p1}, Lb/f/b/b;->d(Lb/f/b/i;)V

    const/4 p1, 0x0

    .line 59
    :goto_d
    iget-object v1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v1}, Lb/f/b/b$a;->b()I

    move-result v1

    if-nez v1, :cond_17

    .line 60
    iput-boolean v0, p0, Lb/f/b/b;->f:Z

    :cond_17
    return p1
.end method

.method public final a(Lb/f/b/i;Lb/f/b/d;)Z
    .registers 3

    .line 61
    iget p1, p1, Lb/f/b/i;->m:I

    const/4 p2, 0x1

    if-gt p1, p2, :cond_6

    goto :goto_7

    :cond_6
    const/4 p2, 0x0

    :goto_7
    return p2
.end method

.method public b(Lb/f/b/i;I)Lb/f/b/b;
    .registers 3

    .line 3
    iput-object p1, p0, Lb/f/b/b;->a:Lb/f/b/i;

    int-to-float p2, p2

    .line 4
    iput p2, p1, Lb/f/b/i;->f:F

    .line 5
    iput p2, p0, Lb/f/b/b;->b:F

    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lb/f/b/b;->f:Z

    return-object p0
.end method

.method public b(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;I)Lb/f/b/b;
    .registers 7

    const/4 v0, 0x0

    if-eqz p4, :cond_b

    if-gez p4, :cond_8

    mul-int/lit8 p4, p4, -0x1

    const/4 v0, 0x1

    :cond_8
    int-to-float p4, p4

    .line 7
    iput p4, p0, Lb/f/b/b;->b:F

    :cond_b
    const/high16 p4, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    if-nez v0, :cond_21

    .line 8
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 9
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 10
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p3, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    goto :goto_30

    .line 11
    :cond_21
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 12
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 13
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p3, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    :goto_30
    return-object p0
.end method

.method public b(Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;Lb/f/b/i;F)Lb/f/b/b;
    .registers 8

    .line 14
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-interface {v0, p3, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 15
    iget-object p3, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p3, p4, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 16
    iget-object p3, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 p4, -0x41000000    # -0.5f

    invoke-interface {p3, p1, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    .line 17
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, p2, p4}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    neg-float p1, p5

    .line 18
    iput p1, p0, Lb/f/b/b;->b:F

    return-object p0
.end method

.method public b(Lb/f/b/d;)Lb/f/b/i;
    .registers 16

    .line 19
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0}, Lb/f/b/b$a;->b()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v2, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_f
    if-ge v4, v0, :cond_6a

    .line 20
    iget-object v9, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v9, v4}, Lb/f/b/b$a;->a(I)F

    move-result v9

    .line 21
    iget-object v10, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v10, v4}, Lb/f/b/b$a;->b(I)Lb/f/b/i;

    move-result-object v10

    .line 22
    iget-object v11, v10, Lb/f/b/i;->j:Lb/f/b/i$a;

    sget-object v12, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    const/4 v13, 0x1

    if-ne v11, v12, :cond_43

    if-nez v1, :cond_2e

    .line 23
    invoke-virtual {p0, v10, p1}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/d;)Z

    move-result v1

    :goto_2a
    move v5, v1

    move v7, v9

    move-object v1, v10

    goto :goto_67

    :cond_2e
    cmpl-float v11, v7, v9

    if-lez v11, :cond_37

    .line 24
    invoke-virtual {p0, v10, p1}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/d;)Z

    move-result v1

    goto :goto_2a

    :cond_37
    if-nez v5, :cond_67

    .line 25
    invoke-virtual {p0, v10, p1}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/d;)Z

    move-result v11

    if-eqz v11, :cond_67

    move v7, v9

    move-object v1, v10

    const/4 v5, 0x1

    goto :goto_67

    :cond_43
    if-nez v1, :cond_67

    cmpg-float v11, v9, v3

    if-gez v11, :cond_67

    if-nez v2, :cond_53

    .line 26
    invoke-virtual {p0, v10, p1}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/d;)Z

    move-result v2

    :goto_4f
    move v6, v2

    move v8, v9

    move-object v2, v10

    goto :goto_67

    :cond_53
    cmpl-float v11, v8, v9

    if-lez v11, :cond_5c

    .line 27
    invoke-virtual {p0, v10, p1}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/d;)Z

    move-result v2

    goto :goto_4f

    :cond_5c
    if-nez v6, :cond_67

    .line 28
    invoke-virtual {p0, v10, p1}, Lb/f/b/b;->a(Lb/f/b/i;Lb/f/b/d;)Z

    move-result v11

    if-eqz v11, :cond_67

    move v8, v9

    move-object v2, v10

    const/4 v6, 0x1

    :cond_67
    :goto_67
    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    :cond_6a
    if-eqz v1, :cond_6d

    return-object v1

    :cond_6d
    return-object v2
.end method

.method public b()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    if-eqz v0, :cond_13

    iget-object v0, v0, Lb/f/b/i;->j:Lb/f/b/i$a;

    sget-object v1, Lb/f/b/i$a;->UNRESTRICTED:Lb/f/b/i$a;

    if-eq v0, v1, :cond_11

    iget v0, p0, Lb/f/b/b;->b:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_13

    :cond_11
    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    return v0
.end method

.method public b(Lb/f/b/i;)Z
    .registers 3

    .line 2
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0, p1}, Lb/f/b/b$a;->b(Lb/f/b/i;)Z

    move-result p1

    return p1
.end method

.method public c(Lb/f/b/i;I)Lb/f/b/b;
    .registers 4

    if-gez p2, :cond_f

    mul-int/lit8 p2, p2, -0x1

    int-to-float p2, p2

    .line 1
    iput p2, p0, Lb/f/b/b;->b:F

    .line 2
    iget-object p2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-interface {p2, p1, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    goto :goto_19

    :cond_f
    int-to-float p2, p2

    .line 3
    iput p2, p0, Lb/f/b/b;->b:F

    .line 4
    iget-object p2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/high16 v0, -0x40800000    # -1.0f

    invoke-interface {p2, p1, v0}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    :goto_19
    return-object p0
.end method

.method public c(Lb/f/b/i;)Lb/f/b/i;
    .registers 3

    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0, p1}, Lb/f/b/b;->a([ZLb/f/b/i;)Lb/f/b/i;

    move-result-object p1

    return-object p1
.end method

.method public c(Lb/f/b/d;)V
    .registers 9

    .line 7
    iget-object v0, p1, Lb/f/b/d;->f:[Lb/f/b/b;

    array-length v0, v0

    if-nez v0, :cond_6

    return-void

    :cond_6
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_8
    if-nez v1, :cond_5f

    .line 8
    iget-object v2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v2}, Lb/f/b/b$a;->b()I

    move-result v2

    const/4 v3, 0x0

    :goto_11
    if-ge v3, v2, :cond_2a

    .line 9
    iget-object v4, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v4, v3}, Lb/f/b/b$a;->b(I)Lb/f/b/i;

    move-result-object v4

    .line 10
    iget v5, v4, Lb/f/b/i;->d:I

    const/4 v6, -0x1

    if-ne v5, v6, :cond_22

    iget-boolean v5, v4, Lb/f/b/i;->g:Z

    if-eqz v5, :cond_27

    .line 11
    :cond_22
    iget-object v5, p0, Lb/f/b/b;->d:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 12
    :cond_2a
    iget-object v2, p0, Lb/f/b/b;->d:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-lez v2, :cond_5d

    .line 13
    iget-object v2, p0, Lb/f/b/b;->d:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_39
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_57

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/f/b/i;

    .line 14
    iget-boolean v5, v4, Lb/f/b/i;->g:Z

    if-eqz v5, :cond_4d

    .line 15
    invoke-virtual {p0, p1, v4, v3}, Lb/f/b/b;->a(Lb/f/b/d;Lb/f/b/i;Z)V

    goto :goto_39

    .line 16
    :cond_4d
    iget-object v5, p1, Lb/f/b/d;->f:[Lb/f/b/b;

    iget v4, v4, Lb/f/b/i;->d:I

    aget-object v4, v5, v4

    invoke-virtual {p0, v4, v3}, Lb/f/b/b;->a(Lb/f/b/b;Z)V

    goto :goto_39

    .line 17
    :cond_57
    iget-object v2, p0, Lb/f/b/b;->d:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    goto :goto_8

    :cond_5d
    const/4 v1, 0x1

    goto :goto_8

    :cond_5f
    return-void
.end method

.method public c()Z
    .registers 3

    .line 5
    iget-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    if-nez v0, :cond_15

    iget v0, p0, Lb/f/b/b;->b:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_15

    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0}, Lb/f/b/b$a;->b()I

    move-result v0

    if-nez v0, :cond_15

    const/4 v0, 0x1

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    return v0
.end method

.method public clear()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0}, Lb/f/b/b$a;->clear()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lb/f/b/b;->b:F

    return-void
.end method

.method public d()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    .line 2
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v0}, Lb/f/b/b$a;->clear()V

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lb/f/b/b;->b:F

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lb/f/b/b;->f:Z

    return-void
.end method

.method public d(Lb/f/b/i;)V
    .registers 5

    .line 5
    iget-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    const/high16 v1, -0x40800000    # -1.0f

    if-eqz v0, :cond_e

    .line 6
    iget-object v2, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v2, v0, v1}, Lb/f/b/b$a;->a(Lb/f/b/i;F)V

    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    .line 8
    :cond_e
    iget-object v0, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    const/4 v2, 0x1

    invoke-interface {v0, p1, v2}, Lb/f/b/b$a;->a(Lb/f/b/i;Z)F

    move-result v0

    mul-float v0, v0, v1

    .line 9
    iput-object p1, p0, Lb/f/b/b;->a:Lb/f/b/i;

    const/high16 p1, 0x3f800000    # 1.0f

    cmpl-float p1, v0, p1

    if-nez p1, :cond_20

    return-void

    .line 10
    :cond_20
    iget p1, p0, Lb/f/b/b;->b:F

    div-float/2addr p1, v0

    iput p1, p0, Lb/f/b/b;->b:F

    .line 11
    iget-object p1, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {p1, v0}, Lb/f/b/b$a;->a(F)V

    return-void
.end method

.method public e()Ljava/lang/String;
    .registers 11

    .line 1
    iget-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    const-string v1, ""

    if-nez v0, :cond_18

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_29

    .line 3
    :cond_18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/b;->a:Lb/f/b/i;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4
    :goto_29
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " = "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5
    iget v1, p0, Lb/f/b/b;->b:F

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    cmpl-float v1, v1, v4

    if-eqz v1, :cond_56

    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lb/f/b/b;->b:F

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    goto :goto_57

    :cond_56
    const/4 v1, 0x0

    .line 7
    :goto_57
    iget-object v5, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v5}, Lb/f/b/b$a;->b()I

    move-result v5

    :goto_5d
    if-ge v2, v5, :cond_ec

    .line 8
    iget-object v6, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v6, v2}, Lb/f/b/b$a;->b(I)Lb/f/b/i;

    move-result-object v6

    if-nez v6, :cond_69

    goto/16 :goto_e8

    .line 9
    :cond_69
    iget-object v7, p0, Lb/f/b/b;->e:Lb/f/b/b$a;

    invoke-interface {v7, v2}, Lb/f/b/b$a;->a(I)F

    move-result v7

    cmpl-float v8, v7, v4

    if-nez v8, :cond_75

    goto/16 :goto_e8

    .line 10
    :cond_75
    invoke-virtual {v6}, Lb/f/b/i;->toString()Ljava/lang/String;

    move-result-object v6

    const/high16 v9, -0x40800000    # -1.0f

    if-nez v1, :cond_93

    cmpg-float v1, v7, v4

    if-gez v1, :cond_ba

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "- "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_b8

    :cond_93
    if-lez v8, :cond_a7

    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " + "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_ba

    .line 13
    :cond_a7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " - "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_b8
    mul-float v7, v7, v9

    :cond_ba
    :goto_ba
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v7, v1

    if-nez v1, :cond_d0

    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e7

    .line 15
    :cond_d0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_e7
    const/4 v1, 0x1

    :goto_e8
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_5d

    :cond_ec
    if-nez v1, :cond_ff

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "0.0"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_ff
    return-object v0
.end method

.method public getKey()Lb/f/b/i;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/b;->a:Lb/f/b/i;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/f/b/b;->e()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
