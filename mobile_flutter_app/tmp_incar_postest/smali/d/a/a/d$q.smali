.class public final Ld/a/a/d$q;
.super Ljava/lang/Object;
.source "BaseDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "q"
.end annotation


# instance fields
.field public final h:Ld/a/a/d;

.field public final i:Ld/a/a/d$i;


# direct methods
.method public constructor <init>(Ld/a/a/d;Ld/a/a/d$i;)V
    .registers 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Ld/a/a/d$q;->h:Ld/a/a/d;

    .line 4
    iput-object p2, p0, Ld/a/a/d$q;->i:Ld/a/a/d$i;

    return-void
.end method

.method public synthetic constructor <init>(Ld/a/a/d;Ld/a/a/d$i;Ld/a/a/d$a;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2}, Ld/a/a/d$q;-><init>(Ld/a/a/d;Ld/a/a/d$i;)V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 1
    iget-object v0, p0, Ld/a/a/d$q;->i:Ld/a/a/d$i;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object v1, p0, Ld/a/a/d$q;->h:Ld/a/a/d;

    invoke-interface {v0, v1, p1}, Ld/a/a/d$i;->a(Ld/a/a/d;Landroid/view/View;)V

    return-void
.end method
