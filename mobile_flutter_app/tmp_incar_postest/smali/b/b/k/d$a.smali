.class public Lb/b/k/d$a;
.super Ljava/lang/Object;
.source "AppCompatDialog.java"

# interfaces
.implements Lb/h/m/f$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/k/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/b/k/d;


# direct methods
.method public constructor <init>(Lb/b/k/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/k/d$a;->h:Lb/b/k/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/KeyEvent;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/k/d$a;->h:Lb/b/k/d;

    invoke-virtual {v0, p1}, Lb/b/k/d;->a(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
