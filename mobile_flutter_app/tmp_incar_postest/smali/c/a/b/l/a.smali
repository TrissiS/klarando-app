.class public final Lc/a/b/l/a;
.super Lc/a/b/l/l;
.source "CodaBarReader.java"


# static fields
.field public static final a:[C

.field public static final b:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const-string v0, "0123456789-$:/.+ABCD"

    .line 1
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lc/a/b/l/a;->a:[C

    const/16 v0, 0x14

    new-array v0, v0, [I

    .line 2
    fill-array-data v0, :array_12

    sput-object v0, Lc/a/b/l/a;->b:[I

    return-void

    :array_12
    .array-data 4
        0x3
        0x6
        0x9
        0x60
        0x12
        0x42
        0x21
        0x24
        0x30
        0x48
        0xc
        0x18
        0x45
        0x51
        0x54
        0x15
        0x1a
        0x29
        0xb
        0xe
    .end array-data
.end method

.method public static a([CC)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_10

    .line 1
    array-length v1, p0

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v1, :cond_10

    aget-char v3, p0, v2

    if-ne v3, p1, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_10
    return v0
.end method
