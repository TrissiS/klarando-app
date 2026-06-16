.class public final Lc/a/b/l/k;
.super Lc/a/b/l/m;
.source "ITFWriter.java"


# static fields
.field public static final a:[I

.field public static final b:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x4

    new-array v0, v0, [I

    .line 1
    fill-array-data v0, :array_12

    sput-object v0, Lc/a/b/l/k;->a:[I

    const/4 v0, 0x3

    new-array v0, v0, [I

    .line 2
    fill-array-data v0, :array_1e

    sput-object v0, Lc/a/b/l/k;->b:[I

    return-void

    nop

    :array_12
    .array-data 4
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_1e
    .array-data 4
        0x3
        0x1
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/b/l/m;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lc/a/b/a;",
            "II",
            "Ljava/util/Map<",
            "Lc/a/b/c;",
            "*>;)",
            "Lc/a/b/j/b;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lc/a/b/h;
        }
    .end annotation

    .line 1
    sget-object v0, Lc/a/b/a;->ITF:Lc/a/b/a;

    if-ne p2, v0, :cond_9

    .line 2
    invoke-super/range {p0 .. p5}, Lc/a/b/l/m;->a(Ljava/lang/String;Lc/a/b/a;IILjava/util/Map;)Lc/a/b/j/b;

    move-result-object p1

    return-object p1

    .line 3
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can only encode ITF, but got "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Ljava/lang/String;)[Z
    .registers 15

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 5
    rem-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_72

    const/16 v1, 0x50

    if-gt v0, v1, :cond_5b

    mul-int/lit8 v1, v0, 0x9

    add-int/lit8 v1, v1, 0x9

    .line 6
    new-array v1, v1, [Z

    .line 7
    sget-object v2, Lc/a/b/l/k;->a:[I

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v1, v3, v2, v4}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v2

    const/4 v5, 0x0

    :goto_1b
    if-ge v5, v0, :cond_55

    .line 8
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0xa

    invoke-static {v6, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v6

    add-int/lit8 v8, v5, 0x1

    .line 9
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v7

    const/16 v8, 0x12

    new-array v8, v8, [I

    const/4 v9, 0x0

    :goto_36
    const/4 v10, 0x5

    if-ge v9, v10, :cond_4d

    mul-int/lit8 v10, v9, 0x2

    .line 10
    sget-object v11, Lc/a/b/l/j;->a:[[I

    aget-object v12, v11, v6

    aget v12, v12, v9

    aput v12, v8, v10

    add-int/2addr v10, v4

    .line 11
    aget-object v11, v11, v7

    aget v11, v11, v9

    aput v11, v8, v10

    add-int/lit8 v9, v9, 0x1

    goto :goto_36

    .line 12
    :cond_4d
    invoke-static {v1, v2, v8, v4}, Lc/a/b/l/m;->a([ZI[IZ)I

    move-result v6

    add-int/2addr v2, v6

    add-int/lit8 v5, v5, 0x2

    goto :goto_1b

    .line 13
    :cond_55
    sget-object p1, Lc/a/b/l/k;->b:[I

    invoke-static {v1, v2, p1, v4}, Lc/a/b/l/m;->a([ZI[IZ)I

    return-object v1

    .line 14
    :cond_5b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested contents should be less than 80 digits long, but got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 15
    :cond_72
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The lenght of the input should be even"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
