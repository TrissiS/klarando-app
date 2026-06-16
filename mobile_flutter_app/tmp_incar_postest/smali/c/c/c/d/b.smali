.class public final enum Lc/c/c/d/b;
.super Ljava/lang/Enum;
.source "ShapeGradientOrientation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/c/c/d/b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BL_TR:Lc/c/c/d/b;

.field public static final enum BOTTOM_TOP:Lc/c/c/d/b;

.field public static final enum BR_TL:Lc/c/c/d/b;

.field public static final enum LEFT_RIGHT:Lc/c/c/d/b;

.field public static final enum RIGHT_LEFT:Lc/c/c/d/b;

.field public static final enum TL_BR:Lc/c/c/d/b;

.field public static final enum TOP_BOTTOM:Lc/c/c/d/b;

.field public static final enum TR_BL:Lc/c/c/d/b;

.field public static final synthetic h:[Lc/c/c/d/b;


# direct methods
.method public static constructor <clinit>()V
    .registers 11

    .line 1
    new-instance v0, Lc/c/c/d/b;

    const/4 v1, 0x0

    const-string v2, "TR_BL"

    invoke-direct {v0, v2, v1}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->TR_BL:Lc/c/c/d/b;

    .line 2
    new-instance v0, Lc/c/c/d/b;

    const/4 v2, 0x1

    const-string v3, "RIGHT_LEFT"

    invoke-direct {v0, v3, v2}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->RIGHT_LEFT:Lc/c/c/d/b;

    .line 3
    new-instance v0, Lc/c/c/d/b;

    const/4 v3, 0x2

    const-string v4, "BR_TL"

    invoke-direct {v0, v4, v3}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->BR_TL:Lc/c/c/d/b;

    .line 4
    new-instance v0, Lc/c/c/d/b;

    const/4 v4, 0x3

    const-string v5, "BOTTOM_TOP"

    invoke-direct {v0, v5, v4}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->BOTTOM_TOP:Lc/c/c/d/b;

    .line 5
    new-instance v0, Lc/c/c/d/b;

    const/4 v5, 0x4

    const-string v6, "BL_TR"

    invoke-direct {v0, v6, v5}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->BL_TR:Lc/c/c/d/b;

    .line 6
    new-instance v0, Lc/c/c/d/b;

    const/4 v6, 0x5

    const-string v7, "LEFT_RIGHT"

    invoke-direct {v0, v7, v6}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->LEFT_RIGHT:Lc/c/c/d/b;

    .line 7
    new-instance v0, Lc/c/c/d/b;

    const/4 v7, 0x6

    const-string v8, "TL_BR"

    invoke-direct {v0, v8, v7}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->TL_BR:Lc/c/c/d/b;

    .line 8
    new-instance v0, Lc/c/c/d/b;

    const/4 v8, 0x7

    const-string v9, "TOP_BOTTOM"

    invoke-direct {v0, v9, v8}, Lc/c/c/d/b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/c/c/d/b;->TOP_BOTTOM:Lc/c/c/d/b;

    const/16 v9, 0x8

    new-array v9, v9, [Lc/c/c/d/b;

    .line 9
    sget-object v10, Lc/c/c/d/b;->TR_BL:Lc/c/c/d/b;

    aput-object v10, v9, v1

    sget-object v1, Lc/c/c/d/b;->RIGHT_LEFT:Lc/c/c/d/b;

    aput-object v1, v9, v2

    sget-object v1, Lc/c/c/d/b;->BR_TL:Lc/c/c/d/b;

    aput-object v1, v9, v3

    sget-object v1, Lc/c/c/d/b;->BOTTOM_TOP:Lc/c/c/d/b;

    aput-object v1, v9, v4

    sget-object v1, Lc/c/c/d/b;->BL_TR:Lc/c/c/d/b;

    aput-object v1, v9, v5

    sget-object v1, Lc/c/c/d/b;->LEFT_RIGHT:Lc/c/c/d/b;

    aput-object v1, v9, v6

    sget-object v1, Lc/c/c/d/b;->TL_BR:Lc/c/c/d/b;

    aput-object v1, v9, v7

    aput-object v0, v9, v8

    sput-object v9, Lc/c/c/d/b;->h:[Lc/c/c/d/b;

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

.method public static valueOf(Ljava/lang/String;)Lc/c/c/d/b;
    .registers 2

    .line 1
    const-class v0, Lc/c/c/d/b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/c/c/d/b;

    return-object p0
.end method

.method public static values()[Lc/c/c/d/b;
    .registers 1

    .line 1
    sget-object v0, Lc/c/c/d/b;->h:[Lc/c/c/d/b;

    invoke-virtual {v0}, [Lc/c/c/d/b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/c/c/d/b;

    return-object v0
.end method
