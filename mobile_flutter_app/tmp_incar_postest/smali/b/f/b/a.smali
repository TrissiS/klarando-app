.class public Lb/f/b/a;
.super Ljava/lang/Object;
.source "ArrayLinkedVariables.java"

# interfaces
.implements Lb/f/b/b$a;


# static fields
.field public static l:F = 0.001f


# instance fields
.field public a:I

.field public final b:Lb/f/b/b;

.field public final c:Lb/f/b/c;

.field public d:I

.field public e:Lb/f/b/i;

.field public f:[I

.field public g:[I

.field public h:[F

.field public i:I

.field public j:I

.field public k:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Lb/f/b/b;Lb/f/b/c;)V
    .registers 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/f/b/a;->a:I

    const/16 v1, 0x8

    .line 3
    iput v1, p0, Lb/f/b/a;->d:I

    const/4 v2, 0x0

    .line 4
    iput-object v2, p0, Lb/f/b/a;->e:Lb/f/b/i;

    new-array v2, v1, [I

    .line 5
    iput-object v2, p0, Lb/f/b/a;->f:[I

    new-array v2, v1, [I

    .line 6
    iput-object v2, p0, Lb/f/b/a;->g:[I

    new-array v1, v1, [F

    .line 7
    iput-object v1, p0, Lb/f/b/a;->h:[F

    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lb/f/b/a;->i:I

    .line 9
    iput v1, p0, Lb/f/b/a;->j:I

    .line 10
    iput-boolean v0, p0, Lb/f/b/a;->k:Z

    .line 11
    iput-object p1, p0, Lb/f/b/a;->b:Lb/f/b/b;

    .line 12
    iput-object p2, p0, Lb/f/b/a;->c:Lb/f/b/c;

    return-void
.end method


# virtual methods
.method public a(I)F
    .registers 5

    .line 144
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    :goto_3
    const/4 v2, -0x1

    if-eq v0, v2, :cond_18

    .line 145
    iget v2, p0, Lb/f/b/a;->a:I

    if-ge v1, v2, :cond_18

    if-ne v1, p1, :cond_11

    .line 146
    iget-object p1, p0, Lb/f/b/a;->h:[F

    aget p1, p1, v0

    return p1

    .line 147
    :cond_11
    iget-object v2, p0, Lb/f/b/a;->g:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_18
    const/4 p1, 0x0

    return p1
.end method

.method public a(Lb/f/b/b;Z)F
    .registers 8

    .line 112
    iget-object v0, p1, Lb/f/b/b;->a:Lb/f/b/i;

    invoke-virtual {p0, v0}, Lb/f/b/a;->a(Lb/f/b/i;)F

    move-result v0

    .line 113
    iget-object v1, p1, Lb/f/b/b;->a:Lb/f/b/i;

    invoke-virtual {p0, v1, p2}, Lb/f/b/a;->a(Lb/f/b/i;Z)F

    .line 114
    iget-object p1, p1, Lb/f/b/b;->e:Lb/f/b/b$a;

    .line 115
    invoke-interface {p1}, Lb/f/b/b$a;->b()I

    move-result v1

    const/4 v2, 0x0

    :goto_12
    if-ge v2, v1, :cond_24

    .line 116
    invoke-interface {p1, v2}, Lb/f/b/b$a;->b(I)Lb/f/b/i;

    move-result-object v3

    .line 117
    invoke-interface {p1, v3}, Lb/f/b/b$a;->a(Lb/f/b/i;)F

    move-result v4

    mul-float v4, v4, v0

    .line 118
    invoke-virtual {p0, v3, v4, p2}, Lb/f/b/a;->a(Lb/f/b/i;FZ)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_24
    return v0
.end method

.method public final a(Lb/f/b/i;)F
    .registers 6

    .line 148
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    :goto_3
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1e

    .line 149
    iget v2, p0, Lb/f/b/a;->a:I

    if-ge v1, v2, :cond_1e

    .line 150
    iget-object v2, p0, Lb/f/b/a;->f:[I

    aget v2, v2, v0

    iget v3, p1, Lb/f/b/i;->c:I

    if-ne v2, v3, :cond_17

    .line 151
    iget-object p1, p0, Lb/f/b/a;->h:[F

    aget p1, p1, v0

    return p1

    .line 152
    :cond_17
    iget-object v2, p0, Lb/f/b/a;->g:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_1e
    const/4 p1, 0x0

    return p1
.end method

.method public final a(Lb/f/b/i;Z)F
    .registers 11

    .line 119
    iget-object v0, p0, Lb/f/b/a;->e:Lb/f/b/i;

    if-ne v0, p1, :cond_7

    const/4 v0, 0x0

    .line 120
    iput-object v0, p0, Lb/f/b/a;->e:Lb/f/b/i;

    .line 121
    :cond_7
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    return v1

    :cond_e
    const/4 v3, 0x0

    const/4 v4, -0x1

    :goto_10
    if-eq v0, v2, :cond_5b

    .line 122
    iget v5, p0, Lb/f/b/a;->a:I

    if-ge v3, v5, :cond_5b

    .line 123
    iget-object v5, p0, Lb/f/b/a;->f:[I

    aget v5, v5, v0

    .line 124
    iget v6, p1, Lb/f/b/i;->c:I

    if-ne v5, v6, :cond_51

    .line 125
    iget v1, p0, Lb/f/b/a;->i:I

    if-ne v0, v1, :cond_29

    .line 126
    iget-object v1, p0, Lb/f/b/a;->g:[I

    aget v1, v1, v0

    iput v1, p0, Lb/f/b/a;->i:I

    goto :goto_2f

    .line 127
    :cond_29
    iget-object v1, p0, Lb/f/b/a;->g:[I

    aget v3, v1, v0

    aput v3, v1, v4

    :goto_2f
    if-eqz p2, :cond_36

    .line 128
    iget-object p2, p0, Lb/f/b/a;->b:Lb/f/b/b;

    invoke-virtual {p1, p2}, Lb/f/b/i;->b(Lb/f/b/b;)V

    .line 129
    :cond_36
    iget p2, p1, Lb/f/b/i;->m:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p1, Lb/f/b/i;->m:I

    .line 130
    iget p1, p0, Lb/f/b/a;->a:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lb/f/b/a;->a:I

    .line 131
    iget-object p1, p0, Lb/f/b/a;->f:[I

    aput v2, p1, v0

    .line 132
    iget-boolean p1, p0, Lb/f/b/a;->k:Z

    if-eqz p1, :cond_4c

    .line 133
    iput v0, p0, Lb/f/b/a;->j:I

    .line 134
    :cond_4c
    iget-object p1, p0, Lb/f/b/a;->h:[F

    aget p1, p1, v0

    return p1

    .line 135
    :cond_51
    iget-object v4, p0, Lb/f/b/a;->g:[I

    aget v4, v4, v0

    add-int/lit8 v3, v3, 0x1

    move v7, v4

    move v4, v0

    move v0, v7

    goto :goto_10

    :cond_5b
    return v1
.end method

.method public a()V
    .registers 6

    .line 136
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    :goto_3
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1b

    .line 137
    iget v2, p0, Lb/f/b/a;->a:I

    if-ge v1, v2, :cond_1b

    .line 138
    iget-object v2, p0, Lb/f/b/a;->h:[F

    aget v3, v2, v0

    const/high16 v4, -0x40800000    # -1.0f

    mul-float v3, v3, v4

    aput v3, v2, v0

    .line 139
    iget-object v2, p0, Lb/f/b/a;->g:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_1b
    return-void
.end method

.method public a(F)V
    .registers 6

    .line 140
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    :goto_3
    const/4 v2, -0x1

    if-eq v0, v2, :cond_18

    .line 141
    iget v2, p0, Lb/f/b/a;->a:I

    if-ge v1, v2, :cond_18

    .line 142
    iget-object v2, p0, Lb/f/b/a;->h:[F

    aget v3, v2, v0

    div-float/2addr v3, p1

    aput v3, v2, v0

    .line 143
    iget-object v2, p0, Lb/f/b/a;->g:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_18
    return-void
.end method

.method public final a(Lb/f/b/i;F)V
    .registers 12

    const/4 v0, 0x1

    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-nez v1, :cond_a

    .line 1
    invoke-virtual {p0, p1, v0}, Lb/f/b/a;->a(Lb/f/b/i;Z)F

    return-void

    .line 2
    :cond_a
    iget v1, p0, Lb/f/b/a;->i:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v1, v3, :cond_44

    .line 3
    iput v2, p0, Lb/f/b/a;->i:I

    .line 4
    iget-object v1, p0, Lb/f/b/a;->h:[F

    aput p2, v1, v2

    .line 5
    iget-object p2, p0, Lb/f/b/a;->f:[I

    iget v1, p1, Lb/f/b/i;->c:I

    aput v1, p2, v2

    .line 6
    iget-object p2, p0, Lb/f/b/a;->g:[I

    aput v3, p2, v2

    .line 7
    iget p2, p1, Lb/f/b/i;->m:I

    add-int/2addr p2, v0

    iput p2, p1, Lb/f/b/i;->m:I

    .line 8
    iget-object p2, p0, Lb/f/b/a;->b:Lb/f/b/b;

    invoke-virtual {p1, p2}, Lb/f/b/i;->a(Lb/f/b/b;)V

    .line 9
    iget p1, p0, Lb/f/b/a;->a:I

    add-int/2addr p1, v0

    iput p1, p0, Lb/f/b/a;->a:I

    .line 10
    iget-boolean p1, p0, Lb/f/b/a;->k:Z

    if-nez p1, :cond_43

    .line 11
    iget p1, p0, Lb/f/b/a;->j:I

    add-int/2addr p1, v0

    iput p1, p0, Lb/f/b/a;->j:I

    .line 12
    iget-object p2, p0, Lb/f/b/a;->f:[I

    array-length v1, p2

    if-lt p1, v1, :cond_43

    .line 13
    iput-boolean v0, p0, Lb/f/b/a;->k:Z

    .line 14
    array-length p1, p2

    sub-int/2addr p1, v0

    iput p1, p0, Lb/f/b/a;->j:I

    :cond_43
    return-void

    :cond_44
    const/4 v4, 0x0

    const/4 v5, -0x1

    :goto_46
    if-eq v1, v3, :cond_65

    .line 15
    iget v6, p0, Lb/f/b/a;->a:I

    if-ge v4, v6, :cond_65

    .line 16
    iget-object v6, p0, Lb/f/b/a;->f:[I

    aget v7, v6, v1

    iget v8, p1, Lb/f/b/i;->c:I

    if-ne v7, v8, :cond_59

    .line 17
    iget-object p1, p0, Lb/f/b/a;->h:[F

    aput p2, p1, v1

    return-void

    .line 18
    :cond_59
    aget v6, v6, v1

    if-ge v6, v8, :cond_5e

    move v5, v1

    .line 19
    :cond_5e
    iget-object v6, p0, Lb/f/b/a;->g:[I

    aget v1, v6, v1

    add-int/lit8 v4, v4, 0x1

    goto :goto_46

    .line 20
    :cond_65
    iget v1, p0, Lb/f/b/a;->j:I

    add-int/lit8 v4, v1, 0x1

    .line 21
    iget-boolean v6, p0, Lb/f/b/a;->k:Z

    if-eqz v6, :cond_76

    .line 22
    iget-object v4, p0, Lb/f/b/a;->f:[I

    aget v6, v4, v1

    if-ne v6, v3, :cond_74

    goto :goto_77

    .line 23
    :cond_74
    array-length v1, v4

    goto :goto_77

    :cond_76
    move v1, v4

    .line 24
    :goto_77
    iget-object v4, p0, Lb/f/b/a;->f:[I

    array-length v6, v4

    if-lt v1, v6, :cond_90

    .line 25
    iget v6, p0, Lb/f/b/a;->a:I

    array-length v4, v4

    if-ge v6, v4, :cond_90

    const/4 v4, 0x0

    .line 26
    :goto_82
    iget-object v6, p0, Lb/f/b/a;->f:[I

    array-length v7, v6

    if-ge v4, v7, :cond_90

    .line 27
    aget v6, v6, v4

    if-ne v6, v3, :cond_8d

    move v1, v4

    goto :goto_90

    :cond_8d
    add-int/lit8 v4, v4, 0x1

    goto :goto_82

    .line 28
    :cond_90
    :goto_90
    iget-object v4, p0, Lb/f/b/a;->f:[I

    array-length v6, v4

    if-lt v1, v6, :cond_be

    .line 29
    array-length v1, v4

    .line 30
    iget v4, p0, Lb/f/b/a;->d:I

    mul-int/lit8 v4, v4, 0x2

    iput v4, p0, Lb/f/b/a;->d:I

    .line 31
    iput-boolean v2, p0, Lb/f/b/a;->k:Z

    add-int/lit8 v2, v1, -0x1

    .line 32
    iput v2, p0, Lb/f/b/a;->j:I

    .line 33
    iget-object v2, p0, Lb/f/b/a;->h:[F

    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, p0, Lb/f/b/a;->h:[F

    .line 34
    iget-object v2, p0, Lb/f/b/a;->f:[I

    iget v4, p0, Lb/f/b/a;->d:I

    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Lb/f/b/a;->f:[I

    .line 35
    iget-object v2, p0, Lb/f/b/a;->g:[I

    iget v4, p0, Lb/f/b/a;->d:I

    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v2

    iput-object v2, p0, Lb/f/b/a;->g:[I

    .line 36
    :cond_be
    iget-object v2, p0, Lb/f/b/a;->f:[I

    iget v4, p1, Lb/f/b/i;->c:I

    aput v4, v2, v1

    .line 37
    iget-object v2, p0, Lb/f/b/a;->h:[F

    aput p2, v2, v1

    if-eq v5, v3, :cond_d3

    .line 38
    iget-object p2, p0, Lb/f/b/a;->g:[I

    aget v2, p2, v5

    aput v2, p2, v1

    .line 39
    aput v1, p2, v5

    goto :goto_db

    .line 40
    :cond_d3
    iget-object p2, p0, Lb/f/b/a;->g:[I

    iget v2, p0, Lb/f/b/a;->i:I

    aput v2, p2, v1

    .line 41
    iput v1, p0, Lb/f/b/a;->i:I

    .line 42
    :goto_db
    iget p2, p1, Lb/f/b/i;->m:I

    add-int/2addr p2, v0

    iput p2, p1, Lb/f/b/i;->m:I

    .line 43
    iget-object p2, p0, Lb/f/b/a;->b:Lb/f/b/b;

    invoke-virtual {p1, p2}, Lb/f/b/i;->a(Lb/f/b/b;)V

    .line 44
    iget p1, p0, Lb/f/b/a;->a:I

    add-int/2addr p1, v0

    iput p1, p0, Lb/f/b/a;->a:I

    .line 45
    iget-boolean p1, p0, Lb/f/b/a;->k:Z

    if-nez p1, :cond_f3

    .line 46
    iget p1, p0, Lb/f/b/a;->j:I

    add-int/2addr p1, v0

    iput p1, p0, Lb/f/b/a;->j:I

    .line 47
    :cond_f3
    iget p1, p0, Lb/f/b/a;->a:I

    iget-object p2, p0, Lb/f/b/a;->f:[I

    array-length p2, p2

    if-lt p1, p2, :cond_fc

    .line 48
    iput-boolean v0, p0, Lb/f/b/a;->k:Z

    .line 49
    :cond_fc
    iget p1, p0, Lb/f/b/a;->j:I

    iget-object p2, p0, Lb/f/b/a;->f:[I

    array-length v1, p2

    if-lt p1, v1, :cond_109

    .line 50
    iput-boolean v0, p0, Lb/f/b/a;->k:Z

    .line 51
    array-length p1, p2

    sub-int/2addr p1, v0

    iput p1, p0, Lb/f/b/a;->j:I

    :cond_109
    return-void
.end method

.method public a(Lb/f/b/i;FZ)V
    .registers 13

    .line 52
    sget v0, Lb/f/b/a;->l:F

    neg-float v1, v0

    cmpl-float v1, p2, v1

    if-lez v1, :cond_c

    cmpg-float v0, p2, v0

    if-gez v0, :cond_c

    return-void

    .line 53
    :cond_c
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ne v0, v2, :cond_47

    .line 54
    iput v1, p0, Lb/f/b/a;->i:I

    .line 55
    iget-object p3, p0, Lb/f/b/a;->h:[F

    aput p2, p3, v1

    .line 56
    iget-object p2, p0, Lb/f/b/a;->f:[I

    iget p3, p1, Lb/f/b/i;->c:I

    aput p3, p2, v1

    .line 57
    iget-object p2, p0, Lb/f/b/a;->g:[I

    aput v2, p2, v1

    .line 58
    iget p2, p1, Lb/f/b/i;->m:I

    add-int/2addr p2, v3

    iput p2, p1, Lb/f/b/i;->m:I

    .line 59
    iget-object p2, p0, Lb/f/b/a;->b:Lb/f/b/b;

    invoke-virtual {p1, p2}, Lb/f/b/i;->a(Lb/f/b/b;)V

    .line 60
    iget p1, p0, Lb/f/b/a;->a:I

    add-int/2addr p1, v3

    iput p1, p0, Lb/f/b/a;->a:I

    .line 61
    iget-boolean p1, p0, Lb/f/b/a;->k:Z

    if-nez p1, :cond_46

    .line 62
    iget p1, p0, Lb/f/b/a;->j:I

    add-int/2addr p1, v3

    iput p1, p0, Lb/f/b/a;->j:I

    .line 63
    iget-object p2, p0, Lb/f/b/a;->f:[I

    array-length p3, p2

    if-lt p1, p3, :cond_46

    .line 64
    iput-boolean v3, p0, Lb/f/b/a;->k:Z

    .line 65
    array-length p1, p2

    sub-int/2addr p1, v3

    iput p1, p0, Lb/f/b/a;->j:I

    :cond_46
    return-void

    :cond_47
    const/4 v4, 0x0

    const/4 v5, -0x1

    :goto_49
    if-eq v0, v2, :cond_a6

    .line 66
    iget v6, p0, Lb/f/b/a;->a:I

    if-ge v4, v6, :cond_a6

    .line 67
    iget-object v6, p0, Lb/f/b/a;->f:[I

    aget v7, v6, v0

    .line 68
    iget v8, p1, Lb/f/b/i;->c:I

    if-ne v7, v8, :cond_9a

    .line 69
    iget-object v1, p0, Lb/f/b/a;->h:[F

    aget v1, v1, v0

    add-float/2addr v1, p2

    .line 70
    sget p2, Lb/f/b/a;->l:F

    neg-float v2, p2

    const/4 v4, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_69

    cmpg-float p2, v1, p2

    if-gez p2, :cond_69

    const/4 v1, 0x0

    .line 71
    :cond_69
    iget-object p2, p0, Lb/f/b/a;->h:[F

    aput v1, p2, v0

    cmpl-float p2, v1, v4

    if-nez p2, :cond_99

    .line 72
    iget p2, p0, Lb/f/b/a;->i:I

    if-ne v0, p2, :cond_7c

    .line 73
    iget-object p2, p0, Lb/f/b/a;->g:[I

    aget p2, p2, v0

    iput p2, p0, Lb/f/b/a;->i:I

    goto :goto_82

    .line 74
    :cond_7c
    iget-object p2, p0, Lb/f/b/a;->g:[I

    aget v1, p2, v0

    aput v1, p2, v5

    :goto_82
    if-eqz p3, :cond_89

    .line 75
    iget-object p2, p0, Lb/f/b/a;->b:Lb/f/b/b;

    invoke-virtual {p1, p2}, Lb/f/b/i;->b(Lb/f/b/b;)V

    .line 76
    :cond_89
    iget-boolean p2, p0, Lb/f/b/a;->k:Z

    if-eqz p2, :cond_8f

    .line 77
    iput v0, p0, Lb/f/b/a;->j:I

    .line 78
    :cond_8f
    iget p2, p1, Lb/f/b/i;->m:I

    sub-int/2addr p2, v3

    iput p2, p1, Lb/f/b/i;->m:I

    .line 79
    iget p1, p0, Lb/f/b/a;->a:I

    sub-int/2addr p1, v3

    iput p1, p0, Lb/f/b/a;->a:I

    :cond_99
    return-void

    .line 80
    :cond_9a
    aget v6, v6, v0

    if-ge v6, v8, :cond_9f

    move v5, v0

    .line 81
    :cond_9f
    iget-object v6, p0, Lb/f/b/a;->g:[I

    aget v0, v6, v0

    add-int/lit8 v4, v4, 0x1

    goto :goto_49

    .line 82
    :cond_a6
    iget p3, p0, Lb/f/b/a;->j:I

    add-int/lit8 v0, p3, 0x1

    .line 83
    iget-boolean v4, p0, Lb/f/b/a;->k:Z

    if-eqz v4, :cond_b7

    .line 84
    iget-object v0, p0, Lb/f/b/a;->f:[I

    aget v4, v0, p3

    if-ne v4, v2, :cond_b5

    goto :goto_b8

    .line 85
    :cond_b5
    array-length p3, v0

    goto :goto_b8

    :cond_b7
    move p3, v0

    .line 86
    :goto_b8
    iget-object v0, p0, Lb/f/b/a;->f:[I

    array-length v4, v0

    if-lt p3, v4, :cond_d1

    .line 87
    iget v4, p0, Lb/f/b/a;->a:I

    array-length v0, v0

    if-ge v4, v0, :cond_d1

    const/4 v0, 0x0

    .line 88
    :goto_c3
    iget-object v4, p0, Lb/f/b/a;->f:[I

    array-length v6, v4

    if-ge v0, v6, :cond_d1

    .line 89
    aget v4, v4, v0

    if-ne v4, v2, :cond_ce

    move p3, v0

    goto :goto_d1

    :cond_ce
    add-int/lit8 v0, v0, 0x1

    goto :goto_c3

    .line 90
    :cond_d1
    :goto_d1
    iget-object v0, p0, Lb/f/b/a;->f:[I

    array-length v4, v0

    if-lt p3, v4, :cond_ff

    .line 91
    array-length p3, v0

    .line 92
    iget v0, p0, Lb/f/b/a;->d:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lb/f/b/a;->d:I

    .line 93
    iput-boolean v1, p0, Lb/f/b/a;->k:Z

    add-int/lit8 v1, p3, -0x1

    .line 94
    iput v1, p0, Lb/f/b/a;->j:I

    .line 95
    iget-object v1, p0, Lb/f/b/a;->h:[F

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v0

    iput-object v0, p0, Lb/f/b/a;->h:[F

    .line 96
    iget-object v0, p0, Lb/f/b/a;->f:[I

    iget v1, p0, Lb/f/b/a;->d:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lb/f/b/a;->f:[I

    .line 97
    iget-object v0, p0, Lb/f/b/a;->g:[I

    iget v1, p0, Lb/f/b/a;->d:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lb/f/b/a;->g:[I

    .line 98
    :cond_ff
    iget-object v0, p0, Lb/f/b/a;->f:[I

    iget v1, p1, Lb/f/b/i;->c:I

    aput v1, v0, p3

    .line 99
    iget-object v0, p0, Lb/f/b/a;->h:[F

    aput p2, v0, p3

    if-eq v5, v2, :cond_114

    .line 100
    iget-object p2, p0, Lb/f/b/a;->g:[I

    aget v0, p2, v5

    aput v0, p2, p3

    .line 101
    aput p3, p2, v5

    goto :goto_11c

    .line 102
    :cond_114
    iget-object p2, p0, Lb/f/b/a;->g:[I

    iget v0, p0, Lb/f/b/a;->i:I

    aput v0, p2, p3

    .line 103
    iput p3, p0, Lb/f/b/a;->i:I

    .line 104
    :goto_11c
    iget p2, p1, Lb/f/b/i;->m:I

    add-int/2addr p2, v3

    iput p2, p1, Lb/f/b/i;->m:I

    .line 105
    iget-object p2, p0, Lb/f/b/a;->b:Lb/f/b/b;

    invoke-virtual {p1, p2}, Lb/f/b/i;->a(Lb/f/b/b;)V

    .line 106
    iget p1, p0, Lb/f/b/a;->a:I

    add-int/2addr p1, v3

    iput p1, p0, Lb/f/b/a;->a:I

    .line 107
    iget-boolean p1, p0, Lb/f/b/a;->k:Z

    if-nez p1, :cond_134

    .line 108
    iget p1, p0, Lb/f/b/a;->j:I

    add-int/2addr p1, v3

    iput p1, p0, Lb/f/b/a;->j:I

    .line 109
    :cond_134
    iget p1, p0, Lb/f/b/a;->j:I

    iget-object p2, p0, Lb/f/b/a;->f:[I

    array-length p3, p2

    if-lt p1, p3, :cond_141

    .line 110
    iput-boolean v3, p0, Lb/f/b/a;->k:Z

    .line 111
    array-length p1, p2

    sub-int/2addr p1, v3

    iput p1, p0, Lb/f/b/a;->j:I

    :cond_141
    return-void
.end method

.method public b()I
    .registers 2

    .line 5
    iget v0, p0, Lb/f/b/a;->a:I

    return v0
.end method

.method public b(I)Lb/f/b/i;
    .registers 5

    .line 6
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    :goto_3
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1e

    .line 7
    iget v2, p0, Lb/f/b/a;->a:I

    if-ge v1, v2, :cond_1e

    if-ne v1, p1, :cond_17

    .line 8
    iget-object p1, p0, Lb/f/b/a;->c:Lb/f/b/c;

    iget-object p1, p1, Lb/f/b/c;->d:[Lb/f/b/i;

    iget-object v1, p0, Lb/f/b/a;->f:[I

    aget v0, v1, v0

    aget-object p1, p1, v0

    return-object p1

    .line 9
    :cond_17
    iget-object v2, p0, Lb/f/b/a;->g:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_1e
    const/4 p1, 0x0

    return-object p1
.end method

.method public b(Lb/f/b/i;)Z
    .registers 8

    .line 1
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_7

    return v2

    :cond_7
    const/4 v3, 0x0

    :goto_8
    if-eq v0, v1, :cond_1f

    .line 2
    iget v4, p0, Lb/f/b/a;->a:I

    if-ge v3, v4, :cond_1f

    .line 3
    iget-object v4, p0, Lb/f/b/a;->f:[I

    aget v4, v4, v0

    iget v5, p1, Lb/f/b/i;->c:I

    if-ne v4, v5, :cond_18

    const/4 p1, 0x1

    return p1

    .line 4
    :cond_18
    iget-object v4, p0, Lb/f/b/a;->g:[I

    aget v0, v4, v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    :cond_1f
    return v2
.end method

.method public final clear()V
    .registers 6

    .line 1
    iget v0, p0, Lb/f/b/a;->i:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_4
    const/4 v3, -0x1

    if-eq v0, v3, :cond_23

    .line 2
    iget v4, p0, Lb/f/b/a;->a:I

    if-ge v2, v4, :cond_23

    .line 3
    iget-object v3, p0, Lb/f/b/a;->c:Lb/f/b/c;

    iget-object v3, v3, Lb/f/b/c;->d:[Lb/f/b/i;

    iget-object v4, p0, Lb/f/b/a;->f:[I

    aget v4, v4, v0

    aget-object v3, v3, v4

    if-eqz v3, :cond_1c

    .line 4
    iget-object v4, p0, Lb/f/b/a;->b:Lb/f/b/b;

    invoke-virtual {v3, v4}, Lb/f/b/i;->b(Lb/f/b/b;)V

    .line 5
    :cond_1c
    iget-object v3, p0, Lb/f/b/a;->g:[I

    aget v0, v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 6
    :cond_23
    iput v3, p0, Lb/f/b/a;->i:I

    .line 7
    iput v3, p0, Lb/f/b/a;->j:I

    .line 8
    iput-boolean v1, p0, Lb/f/b/a;->k:Z

    .line 9
    iput v1, p0, Lb/f/b/a;->a:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .line 1
    iget v0, p0, Lb/f/b/a;->i:I

    const-string v1, ""

    const/4 v2, 0x0

    :goto_5
    const/4 v3, -0x1

    if-eq v0, v3, :cond_55

    .line 2
    iget v3, p0, Lb/f/b/a;->a:I

    if-ge v2, v3, :cond_55

    .line 3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " -> "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/a;->h:[F

    aget v1, v1, v0

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " : "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/a;->c:Lb/f/b/c;

    iget-object v1, v1, Lb/f/b/c;->d:[Lb/f/b/i;

    iget-object v4, p0, Lb/f/b/a;->f:[I

    aget v4, v4, v0

    aget-object v1, v1, v4

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 6
    iget-object v3, p0, Lb/f/b/a;->g:[I

    aget v0, v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_55
    return-object v1
.end method
