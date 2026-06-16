.class public final enum Lb/l/d/w$e$b;
.super Ljava/lang/Enum;
.source "SpecialEffectsController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/w$e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/l/d/w$e$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ADDING:Lb/l/d/w$e$b;

.field public static final enum NONE:Lb/l/d/w$e$b;

.field public static final enum REMOVING:Lb/l/d/w$e$b;

.field public static final synthetic h:[Lb/l/d/w$e$b;


# direct methods
.method public static constructor <clinit>()V
    .registers 6

    .line 1
    new-instance v0, Lb/l/d/w$e$b;

    const/4 v1, 0x0

    const-string v2, "NONE"

    invoke-direct {v0, v2, v1}, Lb/l/d/w$e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/l/d/w$e$b;->NONE:Lb/l/d/w$e$b;

    .line 2
    new-instance v0, Lb/l/d/w$e$b;

    const/4 v2, 0x1

    const-string v3, "ADDING"

    invoke-direct {v0, v3, v2}, Lb/l/d/w$e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/l/d/w$e$b;->ADDING:Lb/l/d/w$e$b;

    .line 3
    new-instance v0, Lb/l/d/w$e$b;

    const/4 v3, 0x2

    const-string v4, "REMOVING"

    invoke-direct {v0, v4, v3}, Lb/l/d/w$e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/l/d/w$e$b;->REMOVING:Lb/l/d/w$e$b;

    const/4 v4, 0x3

    new-array v4, v4, [Lb/l/d/w$e$b;

    .line 4
    sget-object v5, Lb/l/d/w$e$b;->NONE:Lb/l/d/w$e$b;

    aput-object v5, v4, v1

    sget-object v1, Lb/l/d/w$e$b;->ADDING:Lb/l/d/w$e$b;

    aput-object v1, v4, v2

    aput-object v0, v4, v3

    sput-object v4, Lb/l/d/w$e$b;->h:[Lb/l/d/w$e$b;

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

.method public static valueOf(Ljava/lang/String;)Lb/l/d/w$e$b;
    .registers 2

    .line 1
    const-class v0, Lb/l/d/w$e$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/l/d/w$e$b;

    return-object p0
.end method

.method public static values()[Lb/l/d/w$e$b;
    .registers 1

    .line 1
    sget-object v0, Lb/l/d/w$e$b;->h:[Lb/l/d/w$e$b;

    invoke-virtual {v0}, [Lb/l/d/w$e$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/l/d/w$e$b;

    return-object v0
.end method
