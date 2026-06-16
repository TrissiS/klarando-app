.class public final Lb/h/m/i0/c;
.super Ljava/lang/Object;
.source "InputContentInfoCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/m/i0/c$a;,
        Lb/h/m/i0/c$b;,
        Lb/h/m/i0/c$c;
    }
.end annotation


# instance fields
.field public final a:Lb/h/m/i0/c$c;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V
    .registers 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    if-lt v0, v1, :cond_11

    .line 3
    new-instance v0, Lb/h/m/i0/c$a;

    invoke-direct {v0, p1, p2, p3}, Lb/h/m/i0/c$a;-><init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V

    iput-object v0, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    goto :goto_18

    .line 4
    :cond_11
    new-instance v0, Lb/h/m/i0/c$b;

    invoke-direct {v0, p1, p2, p3}, Lb/h/m/i0/c$b;-><init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V

    iput-object v0, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    :goto_18
    return-void
.end method

.method public constructor <init>(Lb/h/m/i0/c$c;)V
    .registers 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-object p1, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    return-void
.end method

.method public static a(Ljava/lang/Object;)Lb/h/m/i0/c;
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 2
    :cond_4
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x19

    if-ge v1, v2, :cond_b

    return-object v0

    .line 3
    :cond_b
    new-instance v0, Lb/h/m/i0/c;

    new-instance v1, Lb/h/m/i0/c$a;

    invoke-direct {v1, p0}, Lb/h/m/i0/c$a;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lb/h/m/i0/c;-><init>(Lb/h/m/i0/c$c;)V

    return-object v0
.end method


# virtual methods
.method public a()Landroid/net/Uri;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    invoke-interface {v0}, Lb/h/m/i0/c$c;->e()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public b()Landroid/content/ClipDescription;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    invoke-interface {v0}, Lb/h/m/i0/c$c;->c()Landroid/content/ClipDescription;

    move-result-object v0

    return-object v0
.end method

.method public c()Landroid/net/Uri;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    invoke-interface {v0}, Lb/h/m/i0/c$c;->b()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public d()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    invoke-interface {v0}, Lb/h/m/i0/c$c;->a()V

    return-void
.end method

.method public e()Ljava/lang/Object;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/m/i0/c;->a:Lb/h/m/i0/c$c;

    invoke-interface {v0}, Lb/h/m/i0/c$c;->d()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
