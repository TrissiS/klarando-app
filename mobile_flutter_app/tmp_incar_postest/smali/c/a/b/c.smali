.class public final enum Lc/a/b/c;
.super Ljava/lang/Enum;
.source "EncodeHintType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/a/b/c;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AZTEC_LAYERS:Lc/a/b/c;

.field public static final enum CHARACTER_SET:Lc/a/b/c;

.field public static final enum DATA_MATRIX_SHAPE:Lc/a/b/c;

.field public static final enum ERROR_CORRECTION:Lc/a/b/c;

.field public static final enum MARGIN:Lc/a/b/c;

.field public static final enum MAX_SIZE:Lc/a/b/c;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum MIN_SIZE:Lc/a/b/c;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum PDF417_COMPACT:Lc/a/b/c;

.field public static final enum PDF417_COMPACTION:Lc/a/b/c;

.field public static final enum PDF417_DIMENSIONS:Lc/a/b/c;

.field public static final synthetic h:[Lc/a/b/c;


# direct methods
.method public static constructor <clinit>()V
    .registers 13

    .line 1
    new-instance v0, Lc/a/b/c;

    const/4 v1, 0x0

    const-string v2, "ERROR_CORRECTION"

    invoke-direct {v0, v2, v1}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->ERROR_CORRECTION:Lc/a/b/c;

    .line 2
    new-instance v0, Lc/a/b/c;

    const/4 v2, 0x1

    const-string v3, "CHARACTER_SET"

    invoke-direct {v0, v3, v2}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    .line 3
    new-instance v0, Lc/a/b/c;

    const/4 v3, 0x2

    const-string v4, "DATA_MATRIX_SHAPE"

    invoke-direct {v0, v4, v3}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->DATA_MATRIX_SHAPE:Lc/a/b/c;

    .line 4
    new-instance v0, Lc/a/b/c;

    const/4 v4, 0x3

    const-string v5, "MIN_SIZE"

    invoke-direct {v0, v5, v4}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->MIN_SIZE:Lc/a/b/c;

    .line 5
    new-instance v0, Lc/a/b/c;

    const/4 v5, 0x4

    const-string v6, "MAX_SIZE"

    invoke-direct {v0, v6, v5}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->MAX_SIZE:Lc/a/b/c;

    .line 6
    new-instance v0, Lc/a/b/c;

    const/4 v6, 0x5

    const-string v7, "MARGIN"

    invoke-direct {v0, v7, v6}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    .line 7
    new-instance v0, Lc/a/b/c;

    const/4 v7, 0x6

    const-string v8, "PDF417_COMPACT"

    invoke-direct {v0, v8, v7}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->PDF417_COMPACT:Lc/a/b/c;

    .line 8
    new-instance v0, Lc/a/b/c;

    const/4 v8, 0x7

    const-string v9, "PDF417_COMPACTION"

    invoke-direct {v0, v9, v8}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->PDF417_COMPACTION:Lc/a/b/c;

    .line 9
    new-instance v0, Lc/a/b/c;

    const/16 v9, 0x8

    const-string v10, "PDF417_DIMENSIONS"

    invoke-direct {v0, v10, v9}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->PDF417_DIMENSIONS:Lc/a/b/c;

    .line 10
    new-instance v0, Lc/a/b/c;

    const/16 v10, 0x9

    const-string v11, "AZTEC_LAYERS"

    invoke-direct {v0, v11, v10}, Lc/a/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/c;->AZTEC_LAYERS:Lc/a/b/c;

    const/16 v11, 0xa

    new-array v11, v11, [Lc/a/b/c;

    .line 11
    sget-object v12, Lc/a/b/c;->ERROR_CORRECTION:Lc/a/b/c;

    aput-object v12, v11, v1

    sget-object v1, Lc/a/b/c;->CHARACTER_SET:Lc/a/b/c;

    aput-object v1, v11, v2

    sget-object v1, Lc/a/b/c;->DATA_MATRIX_SHAPE:Lc/a/b/c;

    aput-object v1, v11, v3

    sget-object v1, Lc/a/b/c;->MIN_SIZE:Lc/a/b/c;

    aput-object v1, v11, v4

    sget-object v1, Lc/a/b/c;->MAX_SIZE:Lc/a/b/c;

    aput-object v1, v11, v5

    sget-object v1, Lc/a/b/c;->MARGIN:Lc/a/b/c;

    aput-object v1, v11, v6

    sget-object v1, Lc/a/b/c;->PDF417_COMPACT:Lc/a/b/c;

    aput-object v1, v11, v7

    sget-object v1, Lc/a/b/c;->PDF417_COMPACTION:Lc/a/b/c;

    aput-object v1, v11, v8

    sget-object v1, Lc/a/b/c;->PDF417_DIMENSIONS:Lc/a/b/c;

    aput-object v1, v11, v9

    aput-object v0, v11, v10

    sput-object v11, Lc/a/b/c;->h:[Lc/a/b/c;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc/a/b/c;
    .registers 2

    .line 1
    const-class v0, Lc/a/b/c;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/a/b/c;

    return-object p0
.end method

.method public static values()[Lc/a/b/c;
    .registers 1

    .line 1
    sget-object v0, Lc/a/b/c;->h:[Lc/a/b/c;

    invoke-virtual {v0}, [Lc/a/b/c;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/a/b/c;

    return-object v0
.end method
