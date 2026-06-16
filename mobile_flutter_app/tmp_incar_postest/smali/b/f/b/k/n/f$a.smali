.class public final enum Lb/f/b/k/n/f$a;
.super Ljava/lang/Enum;
.source "DependencyNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/b/k/n/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/f/b/k/n/f$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BASELINE:Lb/f/b/k/n/f$a;

.field public static final enum BOTTOM:Lb/f/b/k/n/f$a;

.field public static final enum HORIZONTAL_DIMENSION:Lb/f/b/k/n/f$a;

.field public static final enum LEFT:Lb/f/b/k/n/f$a;

.field public static final enum RIGHT:Lb/f/b/k/n/f$a;

.field public static final enum TOP:Lb/f/b/k/n/f$a;

.field public static final enum UNKNOWN:Lb/f/b/k/n/f$a;

.field public static final enum VERTICAL_DIMENSION:Lb/f/b/k/n/f$a;

.field public static final synthetic h:[Lb/f/b/k/n/f$a;


# direct methods
.method public static constructor <clinit>()V
    .registers 11

    .line 1
    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v1, 0x0

    const-string v2, "UNKNOWN"

    invoke-direct {v0, v2, v1}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->UNKNOWN:Lb/f/b/k/n/f$a;

    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v2, 0x1

    const-string v3, "HORIZONTAL_DIMENSION"

    invoke-direct {v0, v3, v2}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->HORIZONTAL_DIMENSION:Lb/f/b/k/n/f$a;

    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v3, 0x2

    const-string v4, "VERTICAL_DIMENSION"

    invoke-direct {v0, v4, v3}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->VERTICAL_DIMENSION:Lb/f/b/k/n/f$a;

    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v4, 0x3

    const-string v5, "LEFT"

    invoke-direct {v0, v5, v4}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->LEFT:Lb/f/b/k/n/f$a;

    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v5, 0x4

    const-string v6, "RIGHT"

    invoke-direct {v0, v6, v5}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->RIGHT:Lb/f/b/k/n/f$a;

    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v6, 0x5

    const-string v7, "TOP"

    invoke-direct {v0, v7, v6}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->TOP:Lb/f/b/k/n/f$a;

    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v7, 0x6

    const-string v8, "BOTTOM"

    invoke-direct {v0, v8, v7}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->BOTTOM:Lb/f/b/k/n/f$a;

    new-instance v0, Lb/f/b/k/n/f$a;

    const/4 v8, 0x7

    const-string v9, "BASELINE"

    invoke-direct {v0, v9, v8}, Lb/f/b/k/n/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/f$a;->BASELINE:Lb/f/b/k/n/f$a;

    const/16 v9, 0x8

    new-array v9, v9, [Lb/f/b/k/n/f$a;

    sget-object v10, Lb/f/b/k/n/f$a;->UNKNOWN:Lb/f/b/k/n/f$a;

    aput-object v10, v9, v1

    sget-object v1, Lb/f/b/k/n/f$a;->HORIZONTAL_DIMENSION:Lb/f/b/k/n/f$a;

    aput-object v1, v9, v2

    sget-object v1, Lb/f/b/k/n/f$a;->VERTICAL_DIMENSION:Lb/f/b/k/n/f$a;

    aput-object v1, v9, v3

    sget-object v1, Lb/f/b/k/n/f$a;->LEFT:Lb/f/b/k/n/f$a;

    aput-object v1, v9, v4

    sget-object v1, Lb/f/b/k/n/f$a;->RIGHT:Lb/f/b/k/n/f$a;

    aput-object v1, v9, v5

    sget-object v1, Lb/f/b/k/n/f$a;->TOP:Lb/f/b/k/n/f$a;

    aput-object v1, v9, v6

    sget-object v1, Lb/f/b/k/n/f$a;->BOTTOM:Lb/f/b/k/n/f$a;

    aput-object v1, v9, v7

    aput-object v0, v9, v8

    sput-object v9, Lb/f/b/k/n/f$a;->h:[Lb/f/b/k/n/f$a;

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

.method public static valueOf(Ljava/lang/String;)Lb/f/b/k/n/f$a;
    .registers 2

    .line 1
    const-class v0, Lb/f/b/k/n/f$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/f/b/k/n/f$a;

    return-object p0
.end method

.method public static values()[Lb/f/b/k/n/f$a;
    .registers 1

    .line 1
    sget-object v0, Lb/f/b/k/n/f$a;->h:[Lb/f/b/k/n/f$a;

    invoke-virtual {v0}, [Lb/f/b/k/n/f$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/k/n/f$a;

    return-object v0
.end method
