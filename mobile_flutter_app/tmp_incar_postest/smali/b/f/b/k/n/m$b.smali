.class public final enum Lb/f/b/k/n/m$b;
.super Ljava/lang/Enum;
.source "WidgetRun.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/f/b/k/n/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lb/f/b/k/n/m$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CENTER:Lb/f/b/k/n/m$b;

.field public static final enum END:Lb/f/b/k/n/m$b;

.field public static final enum NONE:Lb/f/b/k/n/m$b;

.field public static final enum START:Lb/f/b/k/n/m$b;

.field public static final synthetic h:[Lb/f/b/k/n/m$b;


# direct methods
.method public static constructor <clinit>()V
    .registers 7

    .line 1
    new-instance v0, Lb/f/b/k/n/m$b;

    const/4 v1, 0x0

    const-string v2, "NONE"

    invoke-direct {v0, v2, v1}, Lb/f/b/k/n/m$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/m$b;->NONE:Lb/f/b/k/n/m$b;

    new-instance v0, Lb/f/b/k/n/m$b;

    const/4 v2, 0x1

    const-string v3, "START"

    invoke-direct {v0, v3, v2}, Lb/f/b/k/n/m$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/m$b;->START:Lb/f/b/k/n/m$b;

    new-instance v0, Lb/f/b/k/n/m$b;

    const/4 v3, 0x2

    const-string v4, "END"

    invoke-direct {v0, v4, v3}, Lb/f/b/k/n/m$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/m$b;->END:Lb/f/b/k/n/m$b;

    new-instance v0, Lb/f/b/k/n/m$b;

    const/4 v4, 0x3

    const-string v5, "CENTER"

    invoke-direct {v0, v5, v4}, Lb/f/b/k/n/m$b;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb/f/b/k/n/m$b;->CENTER:Lb/f/b/k/n/m$b;

    const/4 v5, 0x4

    new-array v5, v5, [Lb/f/b/k/n/m$b;

    sget-object v6, Lb/f/b/k/n/m$b;->NONE:Lb/f/b/k/n/m$b;

    aput-object v6, v5, v1

    sget-object v1, Lb/f/b/k/n/m$b;->START:Lb/f/b/k/n/m$b;

    aput-object v1, v5, v2

    sget-object v1, Lb/f/b/k/n/m$b;->END:Lb/f/b/k/n/m$b;

    aput-object v1, v5, v3

    aput-object v0, v5, v4

    sput-object v5, Lb/f/b/k/n/m$b;->h:[Lb/f/b/k/n/m$b;

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

.method public static valueOf(Ljava/lang/String;)Lb/f/b/k/n/m$b;
    .registers 2

    .line 1
    const-class v0, Lb/f/b/k/n/m$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb/f/b/k/n/m$b;

    return-object p0
.end method

.method public static values()[Lb/f/b/k/n/m$b;
    .registers 1

    .line 1
    sget-object v0, Lb/f/b/k/n/m$b;->h:[Lb/f/b/k/n/m$b;

    invoke-virtual {v0}, [Lb/f/b/k/n/m$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb/f/b/k/n/m$b;

    return-object v0
.end method
