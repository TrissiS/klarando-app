.class public Lb/f/b/j;
.super Ljava/lang/Object;
.source "SolverVariableValues.java"

# interfaces
.implements Lb/f/b/b$a;


# static fields
.field public static m:F = 0.001f


# instance fields
.field public a:I

.field public b:I

.field public c:[I

.field public d:[I

.field public e:[I

.field public f:[F

.field public g:[I

.field public h:[I

.field public i:I

.field public j:I

.field public final k:Lb/f/b/b;

.field public final l:Lb/f/b/c;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Lb/f/b/b;Lb/f/b/c;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 2
    iput v0, p0, Lb/f/b/j;->a:I

    .line 3
    iput v0, p0, Lb/f/b/j;->b:I

    new-array v1, v0, [I

    .line 4
    iput-object v1, p0, Lb/f/b/j;->c:[I

    new-array v1, v0, [I

    .line 5
    iput-object v1, p0, Lb/f/b/j;->d:[I

    new-array v1, v0, [I

    .line 6
    iput-object v1, p0, Lb/f/b/j;->e:[I

    new-array v1, v0, [F

    .line 7
    iput-object v1, p0, Lb/f/b/j;->f:[F

    new-array v1, v0, [I

    .line 8
    iput-object v1, p0, Lb/f/b/j;->g:[I

    new-array v0, v0, [I

    .line 9
    iput-object v0, p0, Lb/f/b/j;->h:[I

    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lb/f/b/j;->i:I

    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lb/f/b/j;->j:I

    .line 12
    iput-object p1, p0, Lb/f/b/j;->k:Lb/f/b/b;

    .line 13
    iput-object p2, p0, Lb/f/b/j;->l:Lb/f/b/c;

    .line 14
    invoke-virtual {p0}, Lb/f/b/j;->clear()V

    return-void
.end method


# virtual methods
.method public a(I)F
    .registers 6

    .line 1
    iget v0, p0, Lb/f/b/j;->i:I

    .line 2
    iget v1, p0, Lb/f/b/j;->j:I

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_19

    if-ne v2, p1, :cond_e

    .line 3
    iget-object p1, p0, Lb/f/b/j;->f:[F

    aget p1, p1, v1

    return p1

    .line 4
    :cond_e
    iget-object v3, p0, Lb/f/b/j;->h:[I

    aget v1, v3, v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_16

    goto :goto_19

    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_19
    :goto_19
    const/4 p1, 0x0

    return p1
.end method

.method public a(Lb/f/b/b;Z)F
    .registers 10

    .line 58
    iget-object v0, p1, Lb/f/b/b;->a:Lb/f/b/i;

    invoke-virtual {p0, v0}, Lb/f/b/j;->a(Lb/f/b/i;)F

    move-result v0

    .line 59
    iget-object v1, p1, Lb/f/b/b;->a:Lb/f/b/i;

    invoke-virtual {p0, v1, p2}, Lb/f/b/j;->a(Lb/f/b/i;Z)F

    .line 60
    iget-object p1, p1, Lb/f/b/b;->e:Lb/f/b/b$a;

    check-cast p1, Lb/f/b/j;

    .line 61
    invoke-virtual {p1}, Lb/f/b/j;->b()I

    move-result v1

    .line 62
    iget v2, p1, Lb/f/b/j;->j:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_17
    if-ge v2, v1, :cond_36

    .line 63
    iget-object v4, p1, Lb/f/b/j;->e:[I

    aget v5, v4, v3

    const/4 v6, -0x1

    if-eq v5, v6, :cond_33

    .line 64
    iget-object v5, p1, Lb/f/b/j;->f:[F

    aget v5, v5, v3

    .line 65
    iget-object v6, p0, Lb/f/b/j;->l:Lb/f/b/c;

    iget-object v6, v6, Lb/f/b/c;->d:[Lb/f/b/i;

    aget v4, v4, v3

    aget-object v4, v6, v4

    mul-float v5, v5, v0

    .line 66
    invoke-virtual {p0, v4, v5, p2}, Lb/f/b/j;->a(Lb/f/b/i;FZ)V

    add-int/lit8 v2, v2, 0x1

    :cond_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_36
    return v0
.end method

.method public a(Lb/f/b/i;)F
    .registers 3

    .line 5
    invoke-virtual {p0, p1}, Lb/f/b/j;->c(Lb/f/b/i;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_c

    .line 6
    iget-object v0, p0, Lb/f/b/j;->f:[F

    aget p1, v0, p1

    return p1

    :cond_c
    const/4 p1, 0x0

    return p1
.end method

.method public a(Lb/f/b/i;Z)F
    .registers 9

    .line 38
    invoke-virtual {p0, p1}, Lb/f/b/j;->c(Lb/f/b/i;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    const/4 p1, 0x0

    return p1

    .line 39
    :cond_9
    invoke-virtual {p0, p1}, Lb/f/b/j;->d(Lb/f/b/i;)V

    .line 40
    iget-object v2, p0, Lb/f/b/j;->f:[F

    aget v2, v2, v0

    .line 41
    iget v3, p0, Lb/f/b/j;->j:I

    if-ne v3, v0, :cond_1a

    .line 42
    iget-object v3, p0, Lb/f/b/j;->h:[I

    aget v3, v3, v0

    iput v3, p0, Lb/f/b/j;->j:I

    .line 43
    :cond_1a
    iget-object v3, p0, Lb/f/b/j;->e:[I

    aput v1, v3, v0

    .line 44
    iget-object v3, p0, Lb/f/b/j;->g:[I

    aget v4, v3, v0

    if-eq v4, v1, :cond_2c

    .line 45
    iget-object v4, p0, Lb/f/b/j;->h:[I

    aget v3, v3, v0

    aget v5, v4, v0

    aput v5, v4, v3

    .line 46
    :cond_2c
    iget-object v3, p0, Lb/f/b/j;->h:[I

    aget v4, v3, v0

    if-eq v4, v1, :cond_3a

    .line 47
    iget-object v1, p0, Lb/f/b/j;->g:[I

    aget v3, v3, v0

    aget v0, v1, v0

    aput v0, v1, v3

    .line 48
    :cond_3a
    iget v0, p0, Lb/f/b/j;->i:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lb/f/b/j;->i:I

    .line 49
    iget v0, p1, Lb/f/b/i;->m:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p1, Lb/f/b/i;->m:I

    if-eqz p2, :cond_4d

    .line 50
    iget-object p2, p0, Lb/f/b/j;->k:Lb/f/b/b;

    invoke-virtual {p1, p2}, Lb/f/b/i;->b(Lb/f/b/b;)V

    :cond_4d
    return v2
.end method

.method public a()V
    .registers 7

    .line 67
    iget v0, p0, Lb/f/b/j;->i:I

    .line 68
    iget v1, p0, Lb/f/b/j;->j:I

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_1c

    .line 69
    iget-object v3, p0, Lb/f/b/j;->f:[F

    aget v4, v3, v1

    const/high16 v5, -0x40800000    # -1.0f

    mul-float v4, v4, v5

    aput v4, v3, v1

    .line 70
    iget-object v3, p0, Lb/f/b/j;->h:[I

    aget v1, v3, v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_19

    goto :goto_1c

    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_1c
    :goto_1c
    return-void
.end method

.method public a(F)V
    .registers 7

    .line 71
    iget v0, p0, Lb/f/b/j;->i:I

    .line 72
    iget v1, p0, Lb/f/b/j;->j:I

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_19

    .line 73
    iget-object v3, p0, Lb/f/b/j;->f:[F

    aget v4, v3, v1

    div-float/2addr v4, p1

    aput v4, v3, v1

    .line 74
    iget-object v3, p0, Lb/f/b/j;->h:[I

    aget v1, v3, v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_16

    goto :goto_19

    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_19
    :goto_19
    return-void
.end method

.method public final a(ILb/f/b/i;F)V
    .registers 6

    .line 14
    iget-object v0, p0, Lb/f/b/j;->e:[I

    iget v1, p2, Lb/f/b/i;->c:I

    aput v1, v0, p1

    .line 15
    iget-object v0, p0, Lb/f/b/j;->f:[F

    aput p3, v0, p1

    .line 16
    iget-object p3, p0, Lb/f/b/j;->g:[I

    const/4 v0, -0x1

    aput v0, p3, p1

    .line 17
    iget-object p3, p0, Lb/f/b/j;->h:[I

    aput v0, p3, p1

    .line 18
    iget-object p1, p0, Lb/f/b/j;->k:Lb/f/b/b;

    invoke-virtual {p2, p1}, Lb/f/b/i;->a(Lb/f/b/b;)V

    .line 19
    iget p1, p2, Lb/f/b/i;->m:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p2, Lb/f/b/i;->m:I

    .line 20
    iget p1, p0, Lb/f/b/j;->i:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lb/f/b/j;->i:I

    return-void
.end method

.method public a(Lb/f/b/i;F)V
    .registers 11

    .line 21
    sget v0, Lb/f/b/j;->m:F

    neg-float v1, v0

    const/4 v2, 0x1

    cmpl-float v1, p2, v1

    if-lez v1, :cond_10

    cmpg-float v0, p2, v0

    if-gez v0, :cond_10

    .line 22
    invoke-virtual {p0, p1, v2}, Lb/f/b/j;->a(Lb/f/b/i;Z)F

    return-void

    .line 23
    :cond_10
    iget v0, p0, Lb/f/b/j;->i:I

    const/4 v1, 0x0

    if-nez v0, :cond_1e

    .line 24
    invoke-virtual {p0, v1, p1, p2}, Lb/f/b/j;->a(ILb/f/b/i;F)V

    .line 25
    invoke-virtual {p0, p1, v1}, Lb/f/b/j;->a(Lb/f/b/i;I)V

    .line 26
    iput v1, p0, Lb/f/b/j;->j:I

    goto :goto_5a

    .line 27
    :cond_1e
    invoke-virtual {p0, p1}, Lb/f/b/j;->c(Lb/f/b/i;)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_2a

    .line 28
    iget-object p1, p0, Lb/f/b/j;->f:[F

    aput p2, p1, v0

    goto :goto_5a

    .line 29
    :cond_2a
    iget v0, p0, Lb/f/b/j;->i:I

    add-int/2addr v0, v2

    iget v2, p0, Lb/f/b/j;->a:I

    if-lt v0, v2, :cond_34

    .line 30
    invoke-virtual {p0}, Lb/f/b/j;->d()V

    .line 31
    :cond_34
    iget v0, p0, Lb/f/b/j;->i:I

    .line 32
    iget v2, p0, Lb/f/b/j;->j:I

    const/4 v4, -0x1

    :goto_39
    if-ge v1, v0, :cond_57

    .line 33
    iget-object v5, p0, Lb/f/b/j;->e:[I

    aget v6, v5, v2

    iget v7, p1, Lb/f/b/i;->c:I

    if-ne v6, v7, :cond_48

    .line 34
    iget-object p1, p0, Lb/f/b/j;->f:[F

    aput p2, p1, v2

    return-void

    .line 35
    :cond_48
    aget v5, v5, v2

    if-ge v5, v7, :cond_4d

    move v4, v2

    .line 36
    :cond_4d
    iget-object v5, p0, Lb/f/b/j;->h:[I

    aget v2, v5, v2

    if-ne v2, v3, :cond_54

    goto :goto_57

    :cond_54
    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    .line 37
    :cond_57
    :goto_57
    invoke-virtual {p0, v4, p1, p2}, Lb/f/b/j;->b(ILb/f/b/i;F)V

    :goto_5a
    return-void
.end method

.method public a(Lb/f/b/i;FZ)V
    .registers 8

    .line 51
    sget v0, Lb/f/b/j;->m:F

    neg-float v1, v0

    cmpl-float v1, p2, v1

    if-lez v1, :cond_c

    cmpg-float v0, p2, v0

    if-gez v0, :cond_c

    return-void

    .line 52
    :cond_c
    invoke-virtual {p0, p1}, Lb/f/b/j;->c(Lb/f/b/i;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    .line 53
    invoke-virtual {p0, p1, p2}, Lb/f/b/j;->a(Lb/f/b/i;F)V

    goto :goto_33

    .line 54
    :cond_17
    iget-object v1, p0, Lb/f/b/j;->f:[F

    aget v2, v1, v0

    add-float/2addr v2, p2

    aput v2, v1, v0

    .line 55
    aget p2, v1, v0

    sget v2, Lb/f/b/j;->m:F

    neg-float v3, v2

    cmpl-float p2, p2, v3

    if-lez p2, :cond_33

    aget p2, v1, v0

    cmpg-float p2, p2, v2

    if-gez p2, :cond_33

    const/4 p2, 0x0

    .line 56
    aput p2, v1, v0

    .line 57
    invoke-virtual {p0, p1, p3}, Lb/f/b/j;->a(Lb/f/b/i;Z)F

    :cond_33
    :goto_33
    return-void
.end method

.method public final a(Lb/f/b/i;I)V
    .registers 6

    .line 7
    iget p1, p1, Lb/f/b/i;->c:I

    iget v0, p0, Lb/f/b/j;->b:I

    rem-int/2addr p1, v0

    .line 8
    iget-object v0, p0, Lb/f/b/j;->c:[I

    aget v1, v0, p1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_f

    .line 9
    aput p2, v0, p1

    goto :goto_1a

    .line 10
    :cond_f
    :goto_f
    iget-object p1, p0, Lb/f/b/j;->d:[I

    aget v0, p1, v1

    if-eq v0, v2, :cond_18

    .line 11
    aget v1, p1, v1

    goto :goto_f

    .line 12
    :cond_18
    aput p2, p1, v1

    .line 13
    :goto_1a
    iget-object p1, p0, Lb/f/b/j;->d:[I

    aput v2, p1, p2

    return-void
.end method

.method public b()I
    .registers 2

    .line 1
    iget v0, p0, Lb/f/b/j;->i:I

    return v0
.end method

.method public b(I)Lb/f/b/i;
    .registers 8

    .line 2
    iget v0, p0, Lb/f/b/j;->i:I

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 3
    :cond_6
    iget v2, p0, Lb/f/b/j;->j:I

    const/4 v3, 0x0

    :goto_9
    if-ge v3, v0, :cond_25

    const/4 v4, -0x1

    if-ne v3, p1, :cond_1b

    if-eq v2, v4, :cond_1b

    .line 4
    iget-object p1, p0, Lb/f/b/j;->l:Lb/f/b/c;

    iget-object p1, p1, Lb/f/b/c;->d:[Lb/f/b/i;

    iget-object v0, p0, Lb/f/b/j;->e:[I

    aget v0, v0, v2

    aget-object p1, p1, v0

    return-object p1

    .line 5
    :cond_1b
    iget-object v5, p0, Lb/f/b/j;->h:[I

    aget v2, v5, v2

    if-ne v2, v4, :cond_22

    goto :goto_25

    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_25
    :goto_25
    return-object v1
.end method

.method public final b(ILb/f/b/i;F)V
    .registers 7

    .line 7
    invoke-virtual {p0}, Lb/f/b/j;->c()I

    move-result v0

    .line 8
    invoke-virtual {p0, v0, p2, p3}, Lb/f/b/j;->a(ILb/f/b/i;F)V

    const/4 p3, -0x1

    if-eq p1, p3, :cond_17

    .line 9
    iget-object v1, p0, Lb/f/b/j;->g:[I

    aput p1, v1, v0

    .line 10
    iget-object v1, p0, Lb/f/b/j;->h:[I

    aget v2, v1, p1

    aput v2, v1, v0

    .line 11
    aput v0, v1, p1

    goto :goto_2c

    .line 12
    :cond_17
    iget-object p1, p0, Lb/f/b/j;->g:[I

    aput p3, p1, v0

    .line 13
    iget p1, p0, Lb/f/b/j;->i:I

    if-lez p1, :cond_28

    .line 14
    iget-object p1, p0, Lb/f/b/j;->h:[I

    iget v1, p0, Lb/f/b/j;->j:I

    aput v1, p1, v0

    .line 15
    iput v0, p0, Lb/f/b/j;->j:I

    goto :goto_2c

    .line 16
    :cond_28
    iget-object p1, p0, Lb/f/b/j;->h:[I

    aput p3, p1, v0

    .line 17
    :goto_2c
    iget-object p1, p0, Lb/f/b/j;->h:[I

    aget v1, p1, v0

    if-eq v1, p3, :cond_38

    .line 18
    iget-object p3, p0, Lb/f/b/j;->g:[I

    aget p1, p1, v0

    aput v0, p3, p1

    .line 19
    :cond_38
    invoke-virtual {p0, p2, v0}, Lb/f/b/j;->a(Lb/f/b/i;I)V

    return-void
.end method

.method public b(Lb/f/b/i;)Z
    .registers 3

    .line 6
    invoke-virtual {p0, p1}, Lb/f/b/j;->c(Lb/f/b/i;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_9

    const/4 p1, 0x1

    goto :goto_a

    :cond_9
    const/4 p1, 0x0

    :goto_a
    return p1
.end method

.method public final c()I
    .registers 4

    const/4 v0, 0x0

    .line 11
    :goto_1
    iget v1, p0, Lb/f/b/j;->a:I

    const/4 v2, -0x1

    if-ge v0, v1, :cond_10

    .line 12
    iget-object v1, p0, Lb/f/b/j;->e:[I

    aget v1, v1, v0

    if-ne v1, v2, :cond_d

    return v0

    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_10
    return v2
.end method

.method public c(Lb/f/b/i;)I
    .registers 7

    .line 1
    iget v0, p0, Lb/f/b/j;->i:I

    const/4 v1, -0x1

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    iget p1, p1, Lb/f/b/i;->c:I

    .line 3
    iget v0, p0, Lb/f/b/j;->b:I

    rem-int v0, p1, v0

    .line 4
    iget-object v2, p0, Lb/f/b/j;->c:[I

    aget v0, v2, v0

    if-ne v0, v1, :cond_13

    return v1

    .line 5
    :cond_13
    iget-object v2, p0, Lb/f/b/j;->e:[I

    aget v2, v2, v0

    if-ne v2, p1, :cond_1a

    return v0

    .line 6
    :cond_1a
    :goto_1a
    iget-object v2, p0, Lb/f/b/j;->d:[I

    aget v3, v2, v0

    if-eq v3, v1, :cond_2b

    iget-object v3, p0, Lb/f/b/j;->e:[I

    aget v4, v2, v0

    aget v3, v3, v4

    if-eq v3, p1, :cond_2b

    .line 7
    aget v0, v2, v0

    goto :goto_1a

    .line 8
    :cond_2b
    iget-object v2, p0, Lb/f/b/j;->d:[I

    aget v3, v2, v0

    if-ne v3, v1, :cond_32

    return v1

    .line 9
    :cond_32
    iget-object v3, p0, Lb/f/b/j;->e:[I

    aget v4, v2, v0

    aget v3, v3, v4

    if-ne v3, p1, :cond_3d

    .line 10
    aget p1, v2, v0

    return p1

    :cond_3d
    return v1
.end method

.method public clear()V
    .registers 6

    .line 1
    iget v0, p0, Lb/f/b/j;->i:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v0, :cond_14

    .line 2
    invoke-virtual {p0, v2}, Lb/f/b/j;->b(I)Lb/f/b/i;

    move-result-object v3

    if-eqz v3, :cond_11

    .line 3
    iget-object v4, p0, Lb/f/b/j;->k:Lb/f/b/b;

    invoke-virtual {v3, v4}, Lb/f/b/i;->b(Lb/f/b/b;)V

    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_14
    const/4 v0, 0x0

    .line 4
    :goto_15
    iget v2, p0, Lb/f/b/j;->a:I

    const/4 v3, -0x1

    if-ge v0, v2, :cond_25

    .line 5
    iget-object v2, p0, Lb/f/b/j;->e:[I

    aput v3, v2, v0

    .line 6
    iget-object v2, p0, Lb/f/b/j;->d:[I

    aput v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_25
    const/4 v0, 0x0

    .line 7
    :goto_26
    iget v2, p0, Lb/f/b/j;->b:I

    if-ge v0, v2, :cond_31

    .line 8
    iget-object v2, p0, Lb/f/b/j;->c:[I

    aput v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 9
    :cond_31
    iput v1, p0, Lb/f/b/j;->i:I

    .line 10
    iput v3, p0, Lb/f/b/j;->j:I

    return-void
.end method

.method public final d()V
    .registers 5

    .line 1
    iget v0, p0, Lb/f/b/j;->a:I

    mul-int/lit8 v0, v0, 0x2

    .line 2
    iget-object v1, p0, Lb/f/b/j;->e:[I

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Lb/f/b/j;->e:[I

    .line 3
    iget-object v1, p0, Lb/f/b/j;->f:[F

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v1

    iput-object v1, p0, Lb/f/b/j;->f:[F

    .line 4
    iget-object v1, p0, Lb/f/b/j;->g:[I

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Lb/f/b/j;->g:[I

    .line 5
    iget-object v1, p0, Lb/f/b/j;->h:[I

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Lb/f/b/j;->h:[I

    .line 6
    iget-object v1, p0, Lb/f/b/j;->d:[I

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Lb/f/b/j;->d:[I

    .line 7
    iget v1, p0, Lb/f/b/j;->a:I

    :goto_2e
    if-ge v1, v0, :cond_3c

    .line 8
    iget-object v2, p0, Lb/f/b/j;->e:[I

    const/4 v3, -0x1

    aput v3, v2, v1

    .line 9
    iget-object v2, p0, Lb/f/b/j;->d:[I

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2e

    .line 10
    :cond_3c
    iput v0, p0, Lb/f/b/j;->a:I

    return-void
.end method

.method public final d(Lb/f/b/i;)V
    .registers 7

    .line 11
    iget p1, p1, Lb/f/b/i;->c:I

    iget v0, p0, Lb/f/b/j;->b:I

    rem-int v0, p1, v0

    .line 12
    iget-object v1, p0, Lb/f/b/j;->c:[I

    aget v2, v1, v0

    const/4 v3, -0x1

    if-ne v2, v3, :cond_e

    return-void

    .line 13
    :cond_e
    iget-object v4, p0, Lb/f/b/j;->e:[I

    aget v4, v4, v2

    if-ne v4, p1, :cond_1d

    .line 14
    iget-object p1, p0, Lb/f/b/j;->d:[I

    aget v4, p1, v2

    aput v4, v1, v0

    .line 15
    aput v3, p1, v2

    goto :goto_40

    .line 16
    :cond_1d
    :goto_1d
    iget-object v0, p0, Lb/f/b/j;->d:[I

    aget v1, v0, v2

    if-eq v1, v3, :cond_2e

    iget-object v1, p0, Lb/f/b/j;->e:[I

    aget v4, v0, v2

    aget v1, v1, v4

    if-eq v1, p1, :cond_2e

    .line 17
    aget v2, v0, v2

    goto :goto_1d

    .line 18
    :cond_2e
    iget-object v0, p0, Lb/f/b/j;->d:[I

    aget v1, v0, v2

    if-eq v1, v3, :cond_40

    .line 19
    iget-object v4, p0, Lb/f/b/j;->e:[I

    aget v4, v4, v1

    if-ne v4, p1, :cond_40

    .line 20
    aget p1, v0, v1

    aput p1, v0, v2

    .line 21
    aput v3, v0, v1

    :cond_40
    :goto_40
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " { "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2
    iget v1, p0, Lb/f/b/j;->i:I

    const/4 v2, 0x0

    :goto_18
    if-ge v2, v1, :cond_e6

    .line 3
    invoke-virtual {p0, v2}, Lb/f/b/j;->b(I)Lb/f/b/i;

    move-result-object v3

    if-nez v3, :cond_22

    goto/16 :goto_e2

    .line 4
    :cond_22
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " = "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Lb/f/b/j;->a(I)F

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5
    invoke-virtual {p0, v3}, Lb/f/b/j;->c(Lb/f/b/i;)I

    move-result v3

    .line 6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "[p: "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 7
    iget-object v4, p0, Lb/f/b/j;->g:[I

    aget v4, v4, v3

    const-string v5, "none"

    const/4 v6, -0x1

    if-eq v4, v6, :cond_7e

    .line 8
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/f/b/j;->l:Lb/f/b/c;

    iget-object v0, v0, Lb/f/b/c;->d:[Lb/f/b/i;

    iget-object v7, p0, Lb/f/b/j;->e:[I

    iget-object v8, p0, Lb/f/b/j;->g:[I

    aget v8, v8, v3

    aget v7, v7, v8

    aget-object v0, v0, v7

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8d

    .line 9
    :cond_7e
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 10
    :goto_8d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", n: "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 11
    iget-object v4, p0, Lb/f/b/j;->h:[I

    aget v4, v4, v3

    if-eq v4, v6, :cond_c2

    .line 12
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/f/b/j;->l:Lb/f/b/c;

    iget-object v0, v0, Lb/f/b/c;->d:[Lb/f/b/i;

    iget-object v5, p0, Lb/f/b/j;->e:[I

    iget-object v6, p0, Lb/f/b/j;->h:[I

    aget v3, v6, v3

    aget v3, v5, v3

    aget-object v0, v0, v3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_d1

    .line 13
    :cond_c2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 14
    :goto_d1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_e2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_18

    .line 15
    :cond_e6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " }"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
