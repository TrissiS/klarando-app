.class public Lc/a/a/a/p0/d$i;
.super Ljava/lang/Object;
.source "DropdownMenuEndIconDelegate.java"

# interfaces
.implements Landroid/widget/AutoCompleteTextView$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/d;->c(Landroid/widget/AutoCompleteTextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$i;->a:Lc/a/a/a/p0/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/p0/d$i;->a:Lc/a/a/a/p0/d;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lc/a/a/a/p0/d;->b(Lc/a/a/a/p0/d;Z)Z

    .line 2
    iget-object v0, p0, Lc/a/a/a/p0/d$i;->a:Lc/a/a/a/p0/d;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;J)J

    .line 3
    iget-object v0, p0, Lc/a/a/a/p0/d$i;->a:Lc/a/a/a/p0/d;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;Z)V

    return-void
.end method
