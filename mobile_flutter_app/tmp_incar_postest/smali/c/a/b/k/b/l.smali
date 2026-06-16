.class public final enum Lc/a/b/k/b/l;
.super Ljava/lang/Enum;
.source "SymbolShapeHint.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/a/b/k/b/l;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum FORCE_NONE:Lc/a/b/k/b/l;

.field public static final enum FORCE_RECTANGLE:Lc/a/b/k/b/l;

.field public static final enum FORCE_SQUARE:Lc/a/b/k/b/l;

.field public static final synthetic h:[Lc/a/b/k/b/l;


# direct methods
.method public static constructor <clinit>()V
    .registers 6

    .line 1
    new-instance v0, Lc/a/b/k/b/l;

    const/4 v1, 0x0

    const-string v2, "FORCE_NONE"

    invoke-direct {v0, v2, v1}, Lc/a/b/k/b/l;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/k/b/l;->FORCE_NONE:Lc/a/b/k/b/l;

    .line 2
    new-instance v0, Lc/a/b/k/b/l;

    const/4 v2, 0x1

    const-string v3, "FORCE_SQUARE"

    invoke-direct {v0, v3, v2}, Lc/a/b/k/b/l;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/k/b/l;->FORCE_SQUARE:Lc/a/b/k/b/l;

    .line 3
    new-instance v0, Lc/a/b/k/b/l;

    const/4 v3, 0x2

    const-string v4, "FORCE_RECTANGLE"

    invoke-direct {v0, v4, v3}, Lc/a/b/k/b/l;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/k/b/l;->FORCE_RECTANGLE:Lc/a/b/k/b/l;

    const/4 v4, 0x3

    new-array v4, v4, [Lc/a/b/k/b/l;

    .line 4
    sget-object v5, Lc/a/b/k/b/l;->FORCE_NONE:Lc/a/b/k/b/l;

    aput-object v5, v4, v1

    sget-object v1, Lc/a/b/k/b/l;->FORCE_SQUARE:Lc/a/b/k/b/l;

    aput-object v1, v4, v2

    aput-object v0, v4, v3

    sput-object v4, Lc/a/b/k/b/l;->h:[Lc/a/b/k/b/l;

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

.method public static valueOf(Ljava/lang/String;)Lc/a/b/k/b/l;
    .registers 2

    .line 1
    const-class v0, Lc/a/b/k/b/l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/a/b/k/b/l;

    return-object p0
.end method

.method public static values()[Lc/a/b/k/b/l;
    .registers 1

    .line 1
    sget-object v0, Lc/a/b/k/b/l;->h:[Lc/a/b/k/b/l;

    invoke-virtual {v0}, [Lc/a/b/k/b/l;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/a/b/k/b/l;

    return-object v0
.end method
