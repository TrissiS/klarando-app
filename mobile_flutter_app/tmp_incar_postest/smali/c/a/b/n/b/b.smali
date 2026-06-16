.class public final enum Lc/a/b/n/b/b;
.super Ljava/lang/Enum;
.source "Mode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/a/b/n/b/b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ALPHANUMERIC:Lc/a/b/n/b/b;

.field public static final enum BYTE:Lc/a/b/n/b/b;

.field public static final enum ECI:Lc/a/b/n/b/b;

.field public static final enum FNC1_FIRST_POSITION:Lc/a/b/n/b/b;

.field public static final enum FNC1_SECOND_POSITION:Lc/a/b/n/b/b;

.field public static final enum HANZI:Lc/a/b/n/b/b;

.field public static final enum KANJI:Lc/a/b/n/b/b;

.field public static final enum NUMERIC:Lc/a/b/n/b/b;

.field public static final enum STRUCTURED_APPEND:Lc/a/b/n/b/b;

.field public static final enum TERMINATOR:Lc/a/b/n/b/b;

.field public static final synthetic h:[Lc/a/b/n/b/b;


# instance fields
.field public final bits:I

.field public final characterCountBitsForVersions:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 14

    .line 1
    new-instance v0, Lc/a/b/n/b/b;

    const/4 v1, 0x3

    new-array v2, v1, [I

    fill-array-data v2, :array_c8

    const/4 v3, 0x0

    const-string v4, "TERMINATOR"

    invoke-direct {v0, v4, v3, v2, v3}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->TERMINATOR:Lc/a/b/n/b/b;

    .line 2
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_d2

    const/4 v4, 0x1

    const-string v5, "NUMERIC"

    invoke-direct {v0, v5, v4, v2, v4}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->NUMERIC:Lc/a/b/n/b/b;

    .line 3
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_dc

    const/4 v5, 0x2

    const-string v6, "ALPHANUMERIC"

    invoke-direct {v0, v6, v5, v2, v5}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->ALPHANUMERIC:Lc/a/b/n/b/b;

    .line 4
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_e6

    const-string v6, "STRUCTURED_APPEND"

    invoke-direct {v0, v6, v1, v2, v1}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->STRUCTURED_APPEND:Lc/a/b/n/b/b;

    .line 5
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_f0

    const/4 v6, 0x4

    const-string v7, "BYTE"

    invoke-direct {v0, v7, v6, v2, v6}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    .line 6
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_fa

    const/4 v7, 0x7

    const/4 v8, 0x5

    const-string v9, "ECI"

    invoke-direct {v0, v9, v8, v2, v7}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->ECI:Lc/a/b/n/b/b;

    .line 7
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_104

    const/4 v9, 0x6

    const/16 v10, 0x8

    const-string v11, "KANJI"

    invoke-direct {v0, v11, v9, v2, v10}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->KANJI:Lc/a/b/n/b/b;

    .line 8
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_10e

    const-string v11, "FNC1_FIRST_POSITION"

    invoke-direct {v0, v11, v7, v2, v8}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->FNC1_FIRST_POSITION:Lc/a/b/n/b/b;

    .line 9
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_118

    const/16 v11, 0x9

    const-string v12, "FNC1_SECOND_POSITION"

    invoke-direct {v0, v12, v10, v2, v11}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->FNC1_SECOND_POSITION:Lc/a/b/n/b/b;

    .line 10
    new-instance v0, Lc/a/b/n/b/b;

    new-array v2, v1, [I

    fill-array-data v2, :array_122

    const-string v12, "HANZI"

    const/16 v13, 0xd

    invoke-direct {v0, v12, v11, v2, v13}, Lc/a/b/n/b/b;-><init>(Ljava/lang/String;I[II)V

    sput-object v0, Lc/a/b/n/b/b;->HANZI:Lc/a/b/n/b/b;

    const/16 v2, 0xa

    new-array v2, v2, [Lc/a/b/n/b/b;

    .line 11
    sget-object v12, Lc/a/b/n/b/b;->TERMINATOR:Lc/a/b/n/b/b;

    aput-object v12, v2, v3

    sget-object v3, Lc/a/b/n/b/b;->NUMERIC:Lc/a/b/n/b/b;

    aput-object v3, v2, v4

    sget-object v3, Lc/a/b/n/b/b;->ALPHANUMERIC:Lc/a/b/n/b/b;

    aput-object v3, v2, v5

    sget-object v3, Lc/a/b/n/b/b;->STRUCTURED_APPEND:Lc/a/b/n/b/b;

    aput-object v3, v2, v1

    sget-object v1, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    aput-object v1, v2, v6

    sget-object v1, Lc/a/b/n/b/b;->ECI:Lc/a/b/n/b/b;

    aput-object v1, v2, v8

    sget-object v1, Lc/a/b/n/b/b;->KANJI:Lc/a/b/n/b/b;

    aput-object v1, v2, v9

    sget-object v1, Lc/a/b/n/b/b;->FNC1_FIRST_POSITION:Lc/a/b/n/b/b;

    aput-object v1, v2, v7

    sget-object v1, Lc/a/b/n/b/b;->FNC1_SECOND_POSITION:Lc/a/b/n/b/b;

    aput-object v1, v2, v10

    aput-object v0, v2, v11

    sput-object v2, Lc/a/b/n/b/b;->h:[Lc/a/b/n/b/b;

    return-void

    nop

    :array_c8
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_d2
    .array-data 4
        0xa
        0xc
        0xe
    .end array-data

    :array_dc
    .array-data 4
        0x9
        0xb
        0xd
    .end array-data

    :array_e6
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_f0
    .array-data 4
        0x8
        0x10
        0x10
    .end array-data

    :array_fa
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_104
    .array-data 4
        0x8
        0xa
        0xc
    .end array-data

    :array_10e
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_118
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_122
    .array-data 4
        0x8
        0xa
        0xc
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;I[II)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    iput-object p3, p0, Lc/a/b/n/b/b;->characterCountBitsForVersions:[I

    .line 3
    iput p4, p0, Lc/a/b/n/b/b;->bits:I

    return-void
.end method

.method public static forBits(I)Lc/a/b/n/b/b;
    .registers 2

    if-eqz p0, :cond_41

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3e

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3b

    const/4 v0, 0x3

    if-eq p0, v0, :cond_38

    const/4 v0, 0x4

    if-eq p0, v0, :cond_35

    const/4 v0, 0x5

    if-eq p0, v0, :cond_32

    const/4 v0, 0x7

    if-eq p0, v0, :cond_2f

    const/16 v0, 0x8

    if-eq p0, v0, :cond_2c

    const/16 v0, 0x9

    if-eq p0, v0, :cond_29

    const/16 v0, 0xd

    if-ne p0, v0, :cond_23

    .line 1
    sget-object p0, Lc/a/b/n/b/b;->HANZI:Lc/a/b/n/b/b;

    return-object p0

    .line 2
    :cond_23
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 3
    :cond_29
    sget-object p0, Lc/a/b/n/b/b;->FNC1_SECOND_POSITION:Lc/a/b/n/b/b;

    return-object p0

    .line 4
    :cond_2c
    sget-object p0, Lc/a/b/n/b/b;->KANJI:Lc/a/b/n/b/b;

    return-object p0

    .line 5
    :cond_2f
    sget-object p0, Lc/a/b/n/b/b;->ECI:Lc/a/b/n/b/b;

    return-object p0

    .line 6
    :cond_32
    sget-object p0, Lc/a/b/n/b/b;->FNC1_FIRST_POSITION:Lc/a/b/n/b/b;

    return-object p0

    .line 7
    :cond_35
    sget-object p0, Lc/a/b/n/b/b;->BYTE:Lc/a/b/n/b/b;

    return-object p0

    .line 8
    :cond_38
    sget-object p0, Lc/a/b/n/b/b;->STRUCTURED_APPEND:Lc/a/b/n/b/b;

    return-object p0

    .line 9
    :cond_3b
    sget-object p0, Lc/a/b/n/b/b;->ALPHANUMERIC:Lc/a/b/n/b/b;

    return-object p0

    .line 10
    :cond_3e
    sget-object p0, Lc/a/b/n/b/b;->NUMERIC:Lc/a/b/n/b/b;

    return-object p0

    .line 11
    :cond_41
    sget-object p0, Lc/a/b/n/b/b;->TERMINATOR:Lc/a/b/n/b/b;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lc/a/b/n/b/b;
    .registers 2

    .line 1
    const-class v0, Lc/a/b/n/b/b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/a/b/n/b/b;

    return-object p0
.end method

.method public static values()[Lc/a/b/n/b/b;
    .registers 1

    .line 1
    sget-object v0, Lc/a/b/n/b/b;->h:[Lc/a/b/n/b/b;

    invoke-virtual {v0}, [Lc/a/b/n/b/b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/a/b/n/b/b;

    return-object v0
.end method


# virtual methods
.method public getBits()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/n/b/b;->bits:I

    return v0
.end method

.method public getCharacterCountBits(Lc/a/b/n/b/c;)I
    .registers 3

    .line 1
    invoke-virtual {p1}, Lc/a/b/n/b/c;->c()I

    move-result p1

    const/16 v0, 0x9

    if-gt p1, v0, :cond_a

    const/4 p1, 0x0

    goto :goto_11

    :cond_a
    const/16 v0, 0x1a

    if-gt p1, v0, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x2

    .line 2
    :goto_11
    iget-object v0, p0, Lc/a/b/n/b/b;->characterCountBitsForVersions:[I

    aget p1, v0, p1

    return p1
.end method
