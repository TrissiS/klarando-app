.class public final enum Lb/f/b/k/e$b;
.super Ljava/lang/Enum;
.source "ConstraintWidget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/b/k/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/f/b/k/e$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum FIXED:Lb/f/b/k/e$b;

.field public static final enum MATCH_CONSTRAINT:Lb/f/b/k/e$b;

.field public static final enum MATCH_PARENT:Lb/f/b/k/e$b;

.field public static final enum WRAP_CONTENT:Lb/f/b/k/e$b;

.field public static final synthetic h:[Lb/f/b/k/e$b;


# direct methods
.method public static constructor <clinit>()V
    .registers 7

    .line 1
    new-instance v0, Lb/f/b/k/e$b;

    const/4 v1, 0x0

    const-string v2, "FIXED"

    invoke-direct {v0, v2, v1}, Lb/f/b/k/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    new-instance v0, Lb/f/b/k/e$b;

    const/4 v2, 0x1

    const-string v3, "WRAP_CONTENT"

    invoke-direct {v0, v3, v2}, Lb/f/b/k/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    new-instance v0, Lb/f/b/k/e$b;

    const/4 v3, 0x2

    const-string v4, "MATCH_CONSTRAINT"

    invoke-direct {v0, v4, v3}, Lb/f/b/k/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    new-instance v0, Lb/f/b/k/e$b;

    const/4 v4, 0x3

    const-string v5, "MATCH_PARENT"

    invoke-direct {v0, v5, v4}, Lb/f/b/k/e$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    const/4 v5, 0x4

    new-array v5, v5, [Lb/f/b/k/e$b;

    .line 2
    sget-object v6, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    aput-object v6, v5, v1

    sget-object v1, Lb/f/b/k/e$b;->WRAP_CONTENT:Lb/f/b/k/e$b;

    aput-object v1, v5, v2

    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    aput-object v1, v5, v3

    aput-object v0, v5, v4

    sput-object v5, Lb/f/b/k/e$b;->h:[Lb/f/b/k/e$b;

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

.method public static valueOf(Ljava/lang/String;)Lb/f/b/k/e$b;
    .registers 2

    .line 1
    const-class v0, Lb/f/b/k/e$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/f/b/k/e$b;

    return-object p0
.end method

.method public static values()[Lb/f/b/k/e$b;
    .registers 1

    .line 1
    sget-object v0, Lb/f/b/k/e$b;->h:[Lb/f/b/k/e$b;

    invoke-virtual {v0}, [Lb/f/b/k/e$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/k/e$b;

    return-object v0
.end method
