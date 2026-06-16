.class public final Lc/a/b/l/b;
.super Lc/a/b/l/m;
.source "CodaBarWriter.java"


# static fields
.field public static final a:[C

.field public static final b:[C

.field public static final c:[C

.field public static final d:C


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x4

    new-array v1, v0, [C

    .line 1
    fill-array-data v1, :array_1c

    sput-object v1, Lc/a/b/l/b;->a:[C

    new-array v2, v0, [C

    .line 2
    fill-array-data v2, :array_24

    sput-object v2, Lc/a/b/l/b;->b:[C

    new-array v0, v0, [C

    .line 3
    fill-array-data v0, :array_2c

    sput-object v0, Lc/a/b/l/b;->c:[C

    const/4 v0, 0x0

    .line 4
    aget-char v0, v1, v0

    sput-char v0, Lc/a/b/l/b;->d:C

    return-void

    :array_1c
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
    .end array-data

    :array_24
    .array-data 2
        0x54s
        0x4es
        0x2as
        0x45s
    .end array-data

    :array_2c
    .array-data 2
        0x2fs
        0x3as
        0x2bs
        0x2es
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/l/m;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)[Z
    .registers 12

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ge v0, v3, :cond_21

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v3, Lc/a/b/l/b;->d:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-char p1, Lc/a/b/l/b;->d:C

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_9e

    .line 3
    :cond_21
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    .line 5
    sget-object v4, Lc/a/b/l/b;->a:[C

    invoke-static {v4, v0}, Lc/a/b/l/a;->a([CC)Z

    move-result v4

    .line 6
    sget-object v5, Lc/a/b/l/b;->a:[C

    invoke-static {v5, v3}, Lc/a/b/l/a;->a([CC)Z

    move-result v5

    .line 7
    sget-object v6, Lc/a/b/l/b;->b:[C

    invoke-static {v6, v0}, Lc/a/b/l/a;->a([CC)Z

    move-result v0

    .line 8
    sget-object v6, Lc/a/b/l/b;->b:[C

    invoke-static {v6, v3}, Lc/a/b/l/a;->a([CC)Z

    move-result v3

    const-string v6, "Invalid start/end guards: "

    if-eqz v4, :cond_6a

    if-eqz v5, :cond_55

    goto :goto_9e

    .line 9
    :cond_55
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6a
    if-eqz v0, :cond_84

    if-eqz v3, :cond_6f

    goto :goto_9e

    .line 10
    :cond_6f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_84
    if-nez v5, :cond_172

    if-nez v3, :cond_172

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-char v3, Lc/a/b/l/b;->d:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-char p1, Lc/a/b/l/b;->d:C

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_9e
    const/16 v0, 0x14

    const/4 v3, 0x1

    .line 12
    :goto_a1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v2

    if-ge v3, v4, :cond_f7

    .line 13
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-nez v4, :cond_f2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2d

    if-eq v4, v5, :cond_f2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x24

    if-ne v4, v5, :cond_c3

    goto :goto_f2

    .line 14
    :cond_c3
    sget-object v4, Lc/a/b/l/b;->c:[C

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lc/a/b/l/a;->a([CC)Z

    move-result v4

    if-eqz v4, :cond_d2

    add-int/lit8 v0, v0, 0xa

    goto :goto_f4

    .line 15
    :cond_d2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot encode : \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 p1, 0x27

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f2
    :goto_f2
    add-int/lit8 v0, v0, 0x9

    :goto_f4
    add-int/lit8 v3, v3, 0x1

    goto :goto_a1

    .line 16
    :cond_f7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v2

    add-int/2addr v0, v3

    .line 17
    new-array v0, v0, [Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 18
    :goto_101
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_171

    .line 19
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    if-eqz v3, :cond_118

    .line 20
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v2

    if-ne v3, v6, :cond_134

    :cond_118
    const/16 v6, 0x2a

    if-eq v5, v6, :cond_132

    const/16 v6, 0x45

    if-eq v5, v6, :cond_12f

    const/16 v6, 0x4e

    if-eq v5, v6, :cond_12c

    const/16 v6, 0x54

    if-eq v5, v6, :cond_129

    goto :goto_134

    :cond_129
    const/16 v5, 0x41

    goto :goto_134

    :cond_12c
    const/16 v5, 0x42

    goto :goto_134

    :cond_12f
    const/16 v5, 0x44

    goto :goto_134

    :cond_132
    const/16 v5, 0x43

    :cond_134
    :goto_134
    const/4 v6, 0x0

    .line 21
    :goto_135
    sget-object v7, Lc/a/b/l/a;->a:[C

    array-length v8, v7

    if-ge v6, v8, :cond_146

    .line 22
    aget-char v7, v7, v6

    if-ne v5, v7, :cond_143

    .line 23
    sget-object v5, Lc/a/b/l/a;->b:[I

    aget v5, v5, v6

    goto :goto_147

    :cond_143
    add-int/lit8 v6, v6, 0x1

    goto :goto_135

    :cond_146
    const/4 v5, 0x0

    :goto_147
    const/4 v6, 0x0

    const/4 v7, 0x1

    :goto_149
    const/4 v8, 0x0

    :goto_14a
    const/4 v9, 0x7

    if-ge v6, v9, :cond_163

    .line 24
    aput-boolean v7, v0, v4

    add-int/lit8 v4, v4, 0x1

    rsub-int/lit8 v9, v6, 0x6

    shr-int v9, v5, v9

    and-int/2addr v9, v2

    if-eqz v9, :cond_15e

    if-ne v8, v2, :cond_15b

    goto :goto_15e

    :cond_15b
    add-int/lit8 v8, v8, 0x1

    goto :goto_14a

    :cond_15e
    :goto_15e
    xor-int/lit8 v7, v7, 0x1

    add-int/lit8 v6, v6, 0x1

    goto :goto_149

    .line 25
    :cond_163
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v2

    if-ge v3, v5, :cond_16e

    .line 26
    aput-boolean v1, v0, v4

    add-int/lit8 v4, v4, 0x1

    :cond_16e
    add-int/lit8 v3, v3, 0x1

    goto :goto_101

    :cond_171
    return-object v0

    .line 27
    :cond_172
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
