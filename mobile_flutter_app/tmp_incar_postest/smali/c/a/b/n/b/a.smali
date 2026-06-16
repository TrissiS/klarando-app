.class public final enum Lc/a/b/n/b/a;
.super Ljava/lang/Enum;
.source "ErrorCorrectionLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/a/b/n/b/a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum H:Lc/a/b/n/b/a;

.field public static final enum L:Lc/a/b/n/b/a;

.field public static final enum M:Lc/a/b/n/b/a;

.field public static final enum Q:Lc/a/b/n/b/a;

.field public static final h:[Lc/a/b/n/b/a;

.field public static final synthetic i:[Lc/a/b/n/b/a;


# instance fields
.field public final bits:I


# direct methods
.method public static constructor <clinit>()V
    .registers 10

    .line 1
    new-instance v0, Lc/a/b/n/b/a;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v3, "L"

    invoke-direct {v0, v3, v2, v1}, Lc/a/b/n/b/a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lc/a/b/n/b/a;->L:Lc/a/b/n/b/a;

    .line 2
    new-instance v0, Lc/a/b/n/b/a;

    const-string v3, "M"

    invoke-direct {v0, v3, v1, v2}, Lc/a/b/n/b/a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lc/a/b/n/b/a;->M:Lc/a/b/n/b/a;

    .line 3
    new-instance v0, Lc/a/b/n/b/a;

    const/4 v3, 0x3

    const/4 v4, 0x2

    const-string v5, "Q"

    invoke-direct {v0, v5, v4, v3}, Lc/a/b/n/b/a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lc/a/b/n/b/a;->Q:Lc/a/b/n/b/a;

    .line 4
    new-instance v0, Lc/a/b/n/b/a;

    const-string v5, "H"

    invoke-direct {v0, v5, v3, v4}, Lc/a/b/n/b/a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lc/a/b/n/b/a;->H:Lc/a/b/n/b/a;

    const/4 v5, 0x4

    new-array v6, v5, [Lc/a/b/n/b/a;

    .line 5
    sget-object v7, Lc/a/b/n/b/a;->L:Lc/a/b/n/b/a;

    aput-object v7, v6, v2

    sget-object v8, Lc/a/b/n/b/a;->M:Lc/a/b/n/b/a;

    aput-object v8, v6, v1

    sget-object v9, Lc/a/b/n/b/a;->Q:Lc/a/b/n/b/a;

    aput-object v9, v6, v4

    aput-object v0, v6, v3

    sput-object v6, Lc/a/b/n/b/a;->i:[Lc/a/b/n/b/a;

    new-array v5, v5, [Lc/a/b/n/b/a;

    aput-object v8, v5, v2

    aput-object v7, v5, v1

    aput-object v0, v5, v4

    aput-object v9, v5, v3

    .line 6
    sput-object v5, Lc/a/b/n/b/a;->h:[Lc/a/b/n/b/a;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    iput p3, p0, Lc/a/b/n/b/a;->bits:I

    return-void
.end method

.method public static forBits(I)Lc/a/b/n/b/a;
    .registers 3

    if-ltz p0, :cond_a

    .line 1
    sget-object v0, Lc/a/b/n/b/a;->h:[Lc/a/b/n/b/a;

    array-length v1, v0

    if-ge p0, v1, :cond_a

    .line 2
    aget-object p0, v0, p0

    return-object p0

    .line 3
    :cond_a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method public static valueOf(Ljava/lang/String;)Lc/a/b/n/b/a;
    .registers 2

    .line 1
    const-class v0, Lc/a/b/n/b/a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/a/b/n/b/a;

    return-object p0
.end method

.method public static values()[Lc/a/b/n/b/a;
    .registers 1

    .line 1
    sget-object v0, Lc/a/b/n/b/a;->i:[Lc/a/b/n/b/a;

    invoke-virtual {v0}, [Lc/a/b/n/b/a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/a/b/n/b/a;

    return-object v0
.end method


# virtual methods
.method public getBits()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/b/n/b/a;->bits:I

    return v0
.end method
