.class public final Lb/h/m/w;
.super Ljava/lang/Object;
.source "PointerIconCompat.java"


# instance fields
.field public a:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/m/w;->a:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/content/Context;I)Lb/h/m/w;
    .registers 4

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_10

    .line 3
    new-instance v0, Lb/h/m/w;

    invoke-static {p0, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object p0

    invoke-direct {v0, p0}, Lb/h/m/w;-><init>(Ljava/lang/Object;)V

    return-object v0

    .line 4
    :cond_10
    new-instance p0, Lb/h/m/w;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lb/h/m/w;-><init>(Ljava/lang/Object;)V

    return-object p0
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/w;->a:Ljava/lang/Object;

    return-object v0
.end method
