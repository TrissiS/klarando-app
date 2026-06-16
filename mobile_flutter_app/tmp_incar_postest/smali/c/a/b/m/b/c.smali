.class public final enum Lc/a/b/m/b/c;
.super Ljava/lang/Enum;
.source "Compaction.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/a/b/m/b/c;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AUTO:Lc/a/b/m/b/c;

.field public static final enum BYTE:Lc/a/b/m/b/c;

.field public static final enum NUMERIC:Lc/a/b/m/b/c;

.field public static final enum TEXT:Lc/a/b/m/b/c;

.field public static final synthetic h:[Lc/a/b/m/b/c;


# direct methods
.method public static constructor <clinit>()V
    .registers 7

    .line 1
    new-instance v0, Lc/a/b/m/b/c;

    const/4 v1, 0x0

    const-string v2, "AUTO"

    invoke-direct {v0, v2, v1}, Lc/a/b/m/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/m/b/c;->AUTO:Lc/a/b/m/b/c;

    .line 2
    new-instance v0, Lc/a/b/m/b/c;

    const/4 v2, 0x1

    const-string v3, "TEXT"

    invoke-direct {v0, v3, v2}, Lc/a/b/m/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/m/b/c;->TEXT:Lc/a/b/m/b/c;

    .line 3
    new-instance v0, Lc/a/b/m/b/c;

    const/4 v3, 0x2

    const-string v4, "BYTE"

    invoke-direct {v0, v4, v3}, Lc/a/b/m/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/m/b/c;->BYTE:Lc/a/b/m/b/c;

    .line 4
    new-instance v0, Lc/a/b/m/b/c;

    const/4 v4, 0x3

    const-string v5, "NUMERIC"

    invoke-direct {v0, v5, v4}, Lc/a/b/m/b/c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/b/m/b/c;->NUMERIC:Lc/a/b/m/b/c;

    const/4 v5, 0x4

    new-array v5, v5, [Lc/a/b/m/b/c;

    .line 5
    sget-object v6, Lc/a/b/m/b/c;->AUTO:Lc/a/b/m/b/c;

    aput-object v6, v5, v1

    sget-object v1, Lc/a/b/m/b/c;->TEXT:Lc/a/b/m/b/c;

    aput-object v1, v5, v2

    sget-object v1, Lc/a/b/m/b/c;->BYTE:Lc/a/b/m/b/c;

    aput-object v1, v5, v3

    aput-object v0, v5, v4

    sput-object v5, Lc/a/b/m/b/c;->h:[Lc/a/b/m/b/c;

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

.method public static valueOf(Ljava/lang/String;)Lc/a/b/m/b/c;
    .registers 2

    .line 1
    const-class v0, Lc/a/b/m/b/c;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/a/b/m/b/c;

    return-object p0
.end method

.method public static values()[Lc/a/b/m/b/c;
    .registers 1

    .line 1
    sget-object v0, Lc/a/b/m/b/c;->h:[Lc/a/b/m/b/c;

    invoke-virtual {v0}, [Lc/a/b/m/b/c;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/a/b/m/b/c;

    return-object v0
.end method
