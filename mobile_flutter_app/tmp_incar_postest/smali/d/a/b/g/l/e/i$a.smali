.class public Ld/a/b/g/l/e/i$a;
.super Ljava/lang/Object;
.source "DefaultUpdateNotifier.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/e/i;->a(Landroid/app/Activity;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ld/a/b/g/l/e/i;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/e/i;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/e/i$a;->h:Ld/a/b/g/l/e/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 1
    iget-object p2, p0, Ld/a/b/g/l/e/i$a;->h:Ld/a/b/g/l/e/i;

    invoke-virtual {p2}, Ld/a/b/g/l/c/b;->a()V

    .line 2
    check-cast p1, Landroid/app/Dialog;

    invoke-static {p1}, Ld/a/b/g/l/g/c;->b(Landroid/app/Dialog;)V

    return-void
.end method
