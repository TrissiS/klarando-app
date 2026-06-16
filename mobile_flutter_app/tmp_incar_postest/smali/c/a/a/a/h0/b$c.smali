.class public Lc/a/a/a/h0/b$c;
.super Lb/t/a/a/b$a;
.source "BaseProgressIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/h0/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/h0/b;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/b$c;->a:Lc/a/a/a/h0/b;

    invoke-direct {p0}, Lb/t/a/a/b$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lc/a/a/a/h0/b$c;->a:Lc/a/a/a/h0/b;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lc/a/a/a/h0/b;->setIndeterminate(Z)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/b$c;->a:Lc/a/a/a/h0/b;

    invoke-virtual {p1, v0, v0}, Lc/a/a/a/h0/b;->a(IZ)V

    .line 3
    iget-object p1, p0, Lc/a/a/a/h0/b$c;->a:Lc/a/a/a/h0/b;

    invoke-static {p1}, Lc/a/a/a/h0/b;->c(Lc/a/a/a/h0/b;)I

    move-result v0

    iget-object v1, p0, Lc/a/a/a/h0/b$c;->a:Lc/a/a/a/h0/b;

    invoke-static {v1}, Lc/a/a/a/h0/b;->d(Lc/a/a/a/h0/b;)Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lc/a/a/a/h0/b;->a(IZ)V

    return-void
.end method
