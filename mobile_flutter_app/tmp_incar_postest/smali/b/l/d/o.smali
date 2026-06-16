.class public Lb/l/d/o;
.super Ljava/lang/Object;
.source "FragmentStateManager.java"


# instance fields
.field public final a:Lb/l/d/j;

.field public final b:Lb/l/d/p;

.field public final c:Landroidx/fragment/app/Fragment;

.field public d:Z

.field public e:I


# direct methods
.method public constructor <init>(Lb/l/d/j;Lb/l/d/p;Landroidx/fragment/app/Fragment;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lb/l/d/o;->d:Z

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lb/l/d/o;->e:I

    .line 4
    iput-object p1, p0, Lb/l/d/o;->a:Lb/l/d/j;

    .line 5
    iput-object p2, p0, Lb/l/d/o;->b:Lb/l/d/p;

    .line 6
    iput-object p3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    return-void
.end method

.method public constructor <init>(Lb/l/d/j;Lb/l/d/p;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/FragmentState;)V
    .registers 7

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lb/l/d/o;->d:Z

    const/4 v1, -0x1

    .line 34
    iput v1, p0, Lb/l/d/o;->e:I

    .line 35
    iput-object p1, p0, Lb/l/d/o;->a:Lb/l/d/j;

    .line 36
    iput-object p2, p0, Lb/l/d/o;->b:Lb/l/d/p;

    .line 37
    iput-object p3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 p1, 0x0

    .line 38
    iput-object p1, p3, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    .line 39
    iput-object p1, p3, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    .line 40
    iput v0, p3, Landroidx/fragment/app/Fragment;->y:I

    .line 41
    iput-boolean v0, p3, Landroidx/fragment/app/Fragment;->v:Z

    .line 42
    iput-boolean v0, p3, Landroidx/fragment/app/Fragment;->s:Z

    .line 43
    iget-object p2, p3, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    if-eqz p2, :cond_21

    iget-object p2, p2, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    goto :goto_22

    :cond_21
    move-object p2, p1

    :goto_22
    iput-object p2, p3, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    .line 44
    iget-object p2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object p1, p2, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    .line 45
    iget-object p1, p4, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    if-eqz p1, :cond_2f

    .line 46
    iput-object p1, p2, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    goto :goto_36

    .line 47
    :cond_2f
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iput-object p1, p2, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    :goto_36
    return-void
.end method

.method public constructor <init>(Lb/l/d/j;Lb/l/d/p;Ljava/lang/ClassLoader;Lb/l/d/g;Landroidx/fragment/app/FragmentState;)V
    .registers 7

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lb/l/d/o;->d:Z

    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lb/l/d/o;->e:I

    .line 10
    iput-object p1, p0, Lb/l/d/o;->a:Lb/l/d/j;

    .line 11
    iput-object p2, p0, Lb/l/d/o;->b:Lb/l/d/p;

    .line 12
    iget-object p1, p5, Landroidx/fragment/app/FragmentState;->h:Ljava/lang/String;

    invoke-virtual {p4, p3, p1}, Lb/l/d/g;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    iput-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    .line 13
    iget-object p1, p5, Landroidx/fragment/app/FragmentState;->q:Landroid/os/Bundle;

    if-eqz p1, :cond_1c

    .line 14
    invoke-virtual {p1, p3}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 15
    :cond_1c
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object p2, p5, Landroidx/fragment/app/FragmentState;->q:Landroid/os/Bundle;

    invoke-virtual {p1, p2}, Landroidx/fragment/app/Fragment;->m(Landroid/os/Bundle;)V

    .line 16
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object p2, p5, Landroidx/fragment/app/FragmentState;->i:Ljava/lang/String;

    iput-object p2, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    .line 17
    iget-boolean p2, p5, Landroidx/fragment/app/FragmentState;->j:Z

    iput-boolean p2, p1, Landroidx/fragment/app/Fragment;->u:Z

    const/4 p2, 0x1

    .line 18
    iput-boolean p2, p1, Landroidx/fragment/app/Fragment;->w:Z

    .line 19
    iget p2, p5, Landroidx/fragment/app/FragmentState;->k:I

    iput p2, p1, Landroidx/fragment/app/Fragment;->D:I

    .line 20
    iget p2, p5, Landroidx/fragment/app/FragmentState;->l:I

    iput p2, p1, Landroidx/fragment/app/Fragment;->E:I

    .line 21
    iget-object p2, p5, Landroidx/fragment/app/FragmentState;->m:Ljava/lang/String;

    iput-object p2, p1, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    .line 22
    iget-boolean p2, p5, Landroidx/fragment/app/FragmentState;->n:Z

    iput-boolean p2, p1, Landroidx/fragment/app/Fragment;->I:Z

    .line 23
    iget-boolean p2, p5, Landroidx/fragment/app/FragmentState;->o:Z

    iput-boolean p2, p1, Landroidx/fragment/app/Fragment;->t:Z

    .line 24
    iget-boolean p2, p5, Landroidx/fragment/app/FragmentState;->p:Z

    iput-boolean p2, p1, Landroidx/fragment/app/Fragment;->H:Z

    .line 25
    iget-boolean p2, p5, Landroidx/fragment/app/FragmentState;->r:Z

    iput-boolean p2, p1, Landroidx/fragment/app/Fragment;->G:Z

    .line 26
    invoke-static {}, Lb/n/e$c;->values()[Lb/n/e$c;

    move-result-object p2

    iget p3, p5, Landroidx/fragment/app/FragmentState;->s:I

    aget-object p2, p2, p3

    iput-object p2, p1, Landroidx/fragment/app/Fragment;->X:Lb/n/e$c;

    .line 27
    iget-object p1, p5, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    if-eqz p1, :cond_5f

    .line 28
    iget-object p2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object p1, p2, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    goto :goto_68

    .line 29
    :cond_5f
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    iput-object p2, p1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    :goto_68
    const/4 p1, 0x2

    .line 30
    invoke-static {p1}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result p1

    if-eqz p1, :cond_87

    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Instantiated fragment "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "FragmentManager"

    invoke-static {p2, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_87
    return-void
.end method


# virtual methods
.method public a()V
    .registers 5

    const/4 v0, 0x3

    .line 15
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveto ACTIVITY_CREATED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->g(Landroid/os/Bundle;)V

    .line 18
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lb/l/d/j;->a(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;Z)V

    return-void
.end method

.method public a(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/l/d/o;->e:I

    return-void
.end method

.method public a(Ljava/lang/ClassLoader;)V
    .registers 5

    .line 2
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    if-nez v0, :cond_7

    return-void

    .line 3
    :cond_7
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 4
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    const-string v1, "android:view_state"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p1, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    .line 5
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    const-string v1, "android:view_registry_state"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p1, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    .line 6
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    const-string v1, "android:target_state"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    .line 7
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    if-eqz v0, :cond_3f

    .line 8
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    const/4 v1, 0x0

    const-string v2, "android:target_req_state"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p1, Landroidx/fragment/app/Fragment;->q:I

    .line 9
    :cond_3f
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->l:Ljava/lang/Boolean;

    const/4 v1, 0x1

    if-eqz v0, :cond_52

    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->Q:Z

    .line 11
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v0, 0x0

    iput-object v0, p1, Landroidx/fragment/app/Fragment;->l:Ljava/lang/Boolean;

    goto :goto_5c

    .line 12
    :cond_52
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    const-string v2, "android:user_visible_hint"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->Q:Z

    .line 13
    :goto_5c
    iget-object p1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->Q:Z

    if-nez v0, :cond_64

    .line 14
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->P:Z

    :cond_64
    return-void
.end method

.method public final a(Landroid/view/View;)Z
    .registers 4

    .line 19
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_8

    return v1

    .line 20
    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    :goto_c
    if-eqz p1, :cond_1a

    .line 21
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-ne p1, v0, :cond_15

    return v1

    .line 22
    :cond_15
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_c

    :cond_1a
    const/4 p1, 0x0

    return p1
.end method

.method public b()V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/l/d/o;->b:Lb/l/d/p;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Lb/l/d/p;->b(Landroidx/fragment/app/Fragment;)I

    move-result v0

    .line 2
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v2, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public c()V
    .registers 7

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveto ATTACHED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    const-string v2, " that does not belong to this FragmentManager!"

    const-string v3, " declared target fragment "

    const-string v4, "Fragment "

    const/4 v5, 0x0

    if-eqz v1, :cond_66

    .line 4
    iget-object v0, p0, Lb/l/d/o;->b:Lb/l/d/p;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lb/l/d/p;->e(Ljava/lang/String;)Lb/l/d/o;

    move-result-object v0

    if-eqz v0, :cond_42

    .line 5
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v1, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    iput-object v2, v1, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    .line 6
    iput-object v5, v1, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    move-object v5, v0

    goto :goto_97

    .line 7
    :cond_42
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v3, v3, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8
    :cond_66
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    if-eqz v0, :cond_97

    .line 9
    iget-object v1, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v1, v0}, Lb/l/d/p;->e(Ljava/lang/String;)Lb/l/d/o;

    move-result-object v5

    if-eqz v5, :cond_73

    goto :goto_97

    .line 10
    :cond_73
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v3, v3, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_97
    :goto_97
    if-eqz v5, :cond_a9

    .line 11
    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->P:Z

    if-nez v0, :cond_a6

    .line 12
    invoke-virtual {v5}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v0

    iget v0, v0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_a9

    .line 13
    :cond_a6
    invoke-virtual {v5}, Lb/l/d/o;->l()V

    .line 14
    :cond_a9
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->B()Lb/l/d/h;

    move-result-object v1

    iput-object v1, v0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    .line 15
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->E()Landroidx/fragment/app/Fragment;

    move-result-object v1

    iput-object v1, v0, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    .line 16
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lb/l/d/j;->e(Landroidx/fragment/app/Fragment;Z)V

    .line 17
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->h0()V

    .line 18
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1, v2}, Lb/l/d/j;->a(Landroidx/fragment/app/Fragment;Z)V

    return-void
.end method

.method public d()I
    .registers 11

    .line 1
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-nez v1, :cond_9

    .line 2
    iget v0, v0, Landroidx/fragment/app/Fragment;->h:I

    return v0

    .line 3
    :cond_9
    iget v1, p0, Lb/l/d/o;->e:I

    .line 4
    sget-object v2, Lb/l/d/o$b;->a:[I

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->X:Lb/n/e$c;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v2, v0

    const/4 v2, -0x1

    const/4 v3, 0x5

    const/4 v4, 0x3

    const/4 v5, 0x4

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-eq v0, v7, :cond_37

    if-eq v0, v6, :cond_33

    if-eq v0, v4, :cond_2e

    if-eq v0, v5, :cond_28

    .line 5
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_37

    :cond_28
    const/4 v0, 0x0

    .line 6
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_37

    .line 7
    :cond_2e
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_37

    .line 8
    :cond_33
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 9
    :cond_37
    :goto_37
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v8, v0, Landroidx/fragment/app/Fragment;->u:Z

    if-eqz v8, :cond_67

    .line 10
    iget-boolean v8, v0, Landroidx/fragment/app/Fragment;->v:Z

    if-eqz v8, :cond_58

    .line 11
    iget v0, p0, Lb/l/d/o;->e:I

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 12
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_67

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_67

    .line 13
    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_67

    .line 14
    :cond_58
    iget v8, p0, Lb/l/d/o;->e:I

    if-ge v8, v5, :cond_63

    .line 15
    iget v0, v0, Landroidx/fragment/app/Fragment;->h:I

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_67

    .line 16
    :cond_63
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 17
    :cond_67
    :goto_67
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v0, v0, Landroidx/fragment/app/Fragment;->s:Z

    if-nez v0, :cond_71

    .line 18
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    :cond_71
    const/4 v0, 0x0

    .line 19
    sget-boolean v8, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v8, :cond_88

    iget-object v8, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v9, v8, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v9, :cond_88

    .line 20
    invoke-virtual {v8}, Landroidx/fragment/app/Fragment;->A()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 21
    invoke-static {v9, v0}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;

    move-result-object v0

    .line 22
    invoke-virtual {v0, p0}, Lb/l/d/w;->d(Lb/l/d/o;)Lb/l/d/w$e$b;

    move-result-object v0

    .line 23
    :cond_88
    sget-object v8, Lb/l/d/w$e$b;->ADDING:Lb/l/d/w$e$b;

    if-ne v0, v8, :cond_92

    const/4 v0, 0x6

    .line 24
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_b0

    .line 25
    :cond_92
    sget-object v8, Lb/l/d/w$e$b;->REMOVING:Lb/l/d/w$e$b;

    if-ne v0, v8, :cond_9b

    .line 26
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_b0

    .line 27
    :cond_9b
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v4, v0, Landroidx/fragment/app/Fragment;->t:Z

    if-eqz v4, :cond_b0

    .line 28
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->S()Z

    move-result v0

    if-eqz v0, :cond_ac

    .line 29
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_b0

    .line 30
    :cond_ac
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 31
    :cond_b0
    :goto_b0
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v2, v0, Landroidx/fragment/app/Fragment;->P:Z

    if-eqz v2, :cond_be

    iget v0, v0, Landroidx/fragment/app/Fragment;->h:I

    if-ge v0, v3, :cond_be

    .line 32
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 33
    :cond_be
    invoke-static {v6}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_e4

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "computeExpectedState() of "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " for "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "FragmentManager"

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e4
    return v1
.end method

.method public e()V
    .registers 5

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveto CREATED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v1, v0, Landroidx/fragment/app/Fragment;->W:Z

    if-nez v1, :cond_3e

    .line 4
    iget-object v1, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v2, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lb/l/d/j;->c(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;Z)V

    .line 5
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->h(Landroid/os/Bundle;)V

    .line 6
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2, v3}, Lb/l/d/j;->b(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;Z)V

    goto :goto_48

    .line 7
    :cond_3e
    iget-object v1, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->k(Landroid/os/Bundle;)V

    .line 8
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v1, 0x1

    iput v1, v0, Landroidx/fragment/app/Fragment;->h:I

    :goto_48
    return-void
.end method

.method public f()V
    .registers 8

    .line 1
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v0, v0, Landroidx/fragment/app/Fragment;->u:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    const-string v1, "FragmentManager"

    if-eqz v0, :cond_26

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "moveto CREATE_VIEW: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :cond_26
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->i(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v4, v3, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v4, :cond_38

    move-object v2, v4

    goto/16 :goto_b6

    .line 6
    :cond_38
    iget v4, v3, Landroidx/fragment/app/Fragment;->E:I

    if-eqz v4, :cond_b6

    const/4 v2, -0x1

    if-eq v4, v2, :cond_98

    .line 7
    iget-object v2, v3, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v2}, Landroidx/fragment/app/FragmentManager;->x()Lb/l/d/e;

    move-result-object v2

    .line 8
    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v3, v3, Landroidx/fragment/app/Fragment;->E:I

    invoke-virtual {v2, v3}, Lb/l/d/e;->a(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    if-nez v2, :cond_b6

    .line 9
    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v4, v3, Landroidx/fragment/app/Fragment;->w:Z

    if-eqz v4, :cond_58

    goto :goto_b6

    .line 10
    :cond_58
    :try_start_58
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->d()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v1, v1, Landroidx/fragment/app/Fragment;->E:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_64
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_58 .. :try_end_64} :catch_65

    goto :goto_67

    :catch_65
    const-string v0, "unknown"

    .line 11
    :goto_67
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No view found for id 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v3, v3, Landroidx/fragment/app/Fragment;->E:I

    .line 12
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") for fragment "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 13
    :cond_98
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot create fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for a container view with no id"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 14
    :cond_b6
    :goto_b6
    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object v2, v3, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 15
    iget-object v4, v3, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v3, v0, v2, v4}, Landroidx/fragment/app/Fragment;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 16
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    const/4 v3, 0x2

    if-eqz v0, :cond_179

    const/4 v4, 0x0

    .line 17
    invoke-virtual {v0, v4}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    .line 18
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    sget v6, Lb/l/b;->fragment_container_view_tag:I

    invoke-virtual {v5, v6, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    if-eqz v2, :cond_d8

    .line 19
    invoke-virtual {p0}, Lb/l/d/o;->b()V

    .line 20
    :cond_d8
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v2, v0, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz v2, :cond_e5

    .line 21
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 22
    :cond_e5
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-static {v0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_f7

    .line 23
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-static {v0}, Lb/h/m/y;->P(Landroid/view/View;)V

    goto :goto_103

    .line 24
    :cond_f7
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 25
    new-instance v2, Lb/l/d/o$a;

    invoke-direct {v2, p0, v0}, Lb/l/d/o$a;-><init>(Lb/l/d/o;Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 26
    :goto_103
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->r0()V

    .line 27
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    iget-object v6, v2, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v2, v5, v6, v4}, Lb/l/d/j;->a(Landroidx/fragment/app/Fragment;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 28
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    .line 29
    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v2

    .line 30
    sget-boolean v5, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v5, :cond_16e

    .line 31
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v4, v2}, Landroidx/fragment/app/Fragment;->a(F)V

    .line 32
    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v4, v2, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v4, :cond_179

    if-nez v0, :cond_179

    .line 33
    iget-object v0, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_165

    .line 34
    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v2, v0}, Landroidx/fragment/app/Fragment;->c(Landroid/view/View;)V

    .line 35
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v2

    if-eqz v2, :cond_165

    .line 36
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "requestFocus: Saved focused view "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " for Fragment "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    :cond_165
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_179

    .line 38
    :cond_16e
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    if-nez v0, :cond_177

    iget-object v0, v1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v0, :cond_177

    const/4 v4, 0x1

    :cond_177
    iput-boolean v4, v1, Landroidx/fragment/app/Fragment;->S:Z

    .line 39
    :cond_179
    :goto_179
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput v3, v0, Landroidx/fragment/app/Fragment;->h:I

    return-void
.end method

.method public g()V
    .registers 6

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "movefrom CREATED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v1, v0, Landroidx/fragment/app/Fragment;->t:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2f

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->S()Z

    move-result v0

    if-nez v0, :cond_2f

    const/4 v0, 0x1

    goto :goto_30

    :cond_2f
    const/4 v0, 0x0

    :goto_30
    if-nez v0, :cond_43

    .line 4
    iget-object v1, p0, Lb/l/d/o;->b:Lb/l/d/p;

    .line 5
    invoke-virtual {v1}, Lb/l/d/p;->e()Lb/l/d/l;

    move-result-object v1

    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v4}, Lb/l/d/l;->f(Landroidx/fragment/app/Fragment;)Z

    move-result v1

    if-eqz v1, :cond_41

    goto :goto_43

    :cond_41
    const/4 v1, 0x0

    goto :goto_44

    :cond_43
    :goto_43
    const/4 v1, 0x1

    :goto_44
    if-eqz v1, :cond_cb

    .line 6
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    .line 7
    instance-of v4, v1, Lb/n/t;

    if-eqz v4, :cond_59

    .line 8
    iget-object v1, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v1}, Lb/l/d/p;->e()Lb/l/d/l;

    move-result-object v1

    invoke-virtual {v1}, Lb/l/d/l;->d()Z

    move-result v2

    goto :goto_6c

    .line 9
    :cond_59
    invoke-virtual {v1}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v4

    instance-of v4, v4, Landroid/app/Activity;

    if-eqz v4, :cond_6c

    .line 10
    invoke-virtual {v1}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 11
    invoke-virtual {v1}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v1

    xor-int/2addr v2, v1

    :cond_6c
    :goto_6c
    if-nez v0, :cond_70

    if-eqz v2, :cond_7b

    .line 12
    :cond_70
    iget-object v0, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->e()Lb/l/d/l;

    move-result-object v0

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Lb/l/d/l;->b(Landroidx/fragment/app/Fragment;)V

    .line 13
    :cond_7b
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->i0()V

    .line 14
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1, v3}, Lb/l/d/j;->b(Landroidx/fragment/app/Fragment;Z)V

    .line 15
    iget-object v0, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_91
    :goto_91
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    if-eqz v1, :cond_91

    .line 16
    invoke-virtual {v1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 17
    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    iget-object v3, v1, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_91

    .line 18
    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object v2, v1, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    const/4 v2, 0x0

    .line 19
    iput-object v2, v1, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    goto :goto_91

    .line 20
    :cond_b7
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    if-eqz v1, :cond_c5

    .line 21
    iget-object v2, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v2, v1}, Lb/l/d/p;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    iput-object v1, v0, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    .line 22
    :cond_c5
    iget-object v0, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v0, p0}, Lb/l/d/p;->b(Lb/l/d/o;)V

    goto :goto_e5

    .line 23
    :cond_cb
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    if-eqz v0, :cond_e1

    .line 24
    iget-object v1, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v1, v0}, Lb/l/d/p;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_e1

    .line 25
    iget-boolean v1, v0, Landroidx/fragment/app/Fragment;->I:Z

    if-eqz v1, :cond_e1

    .line 26
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object v0, v1, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    .line 27
    :cond_e1
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput v3, v0, Landroidx/fragment/app/Fragment;->h:I

    :goto_e5
    return-void
.end method

.method public h()V
    .registers 4

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "movefrom CREATE_VIEW: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v1, :cond_2c

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_2c

    .line 4
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 5
    :cond_2c
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->j0()V

    .line 6
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lb/l/d/j;->i(Landroidx/fragment/app/Fragment;Z)V

    .line 7
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v1, 0x0

    iput-object v1, v0, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 8
    iput-object v1, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 9
    iput-object v1, v0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    .line 10
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->a0:Lb/n/m;

    invoke-virtual {v0, v1}, Lb/n/m;->a(Ljava/lang/Object;)V

    .line 11
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-boolean v2, v0, Landroidx/fragment/app/Fragment;->v:Z

    return-void
.end method

.method public i()V
    .registers 6

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v1

    const-string v2, "FragmentManager"

    if-eqz v1, :cond_1f

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "movefrom ATTACHED: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->k0()V

    .line 4
    iget-object v1, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lb/l/d/j;->c(Landroidx/fragment/app/Fragment;Z)V

    .line 5
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v3, -0x1

    iput v3, v1, Landroidx/fragment/app/Fragment;->h:I

    const/4 v3, 0x0

    .line 6
    iput-object v3, v1, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    .line 7
    iput-object v3, v1, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    .line 8
    iput-object v3, v1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    .line 9
    iget-boolean v3, v1, Landroidx/fragment/app/Fragment;->t:Z

    if-eqz v3, :cond_43

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->S()Z

    move-result v1

    if-nez v1, :cond_43

    const/4 v4, 0x1

    :cond_43
    if-nez v4, :cond_53

    .line 10
    iget-object v1, p0, Lb/l/d/o;->b:Lb/l/d/p;

    invoke-virtual {v1}, Lb/l/d/p;->e()Lb/l/d/l;

    move-result-object v1

    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v3}, Lb/l/d/l;->f(Landroidx/fragment/app/Fragment;)Z

    move-result v1

    if-eqz v1, :cond_74

    .line 11
    :cond_53
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initState called for fragment: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    :cond_6f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->P()V

    :cond_74
    return-void
.end method

.method public j()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v1, v0, Landroidx/fragment/app/Fragment;->u:Z

    if-eqz v1, :cond_72

    iget-boolean v1, v0, Landroidx/fragment/app/Fragment;->v:Z

    if-eqz v1, :cond_72

    iget-boolean v0, v0, Landroidx/fragment/app/Fragment;->x:Z

    if-nez v0, :cond_72

    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveto CREATE_VIEW: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :cond_2d
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->i(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v3, v3, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2, v3}, Landroidx/fragment/app/Fragment;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 5
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_72

    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    .line 7
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    sget v3, Lb/l/b;->fragment_container_view_tag:I

    invoke-virtual {v2, v3, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 8
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v2, v0, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz v2, :cond_5d

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 9
    :cond_5d
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->r0()V

    .line 10
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v3, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    iget-object v4, v2, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {v0, v2, v3, v4, v1}, Lb/l/d/j;->a(Landroidx/fragment/app/Fragment;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 11
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v1, 0x2

    iput v1, v0, Landroidx/fragment/app/Fragment;->h:I

    :cond_72
    return-void
.end method

.method public k()Landroidx/fragment/app/Fragment;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    return-object v0
.end method

.method public l()V
    .registers 8

    .line 1
    iget-boolean v0, p0, Lb/l/d/o;->d:Z

    const-string v1, "FragmentManager"

    const/4 v2, 0x2

    if-eqz v0, :cond_26

    .line 2
    invoke-static {v2}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignoring re-entrant call to moveToExpectedState() for "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    invoke-virtual {p0}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_25
    return-void

    :cond_26
    const/4 v0, 0x0

    const/4 v3, 0x1

    .line 6
    :try_start_28
    iput-boolean v3, p0, Lb/l/d/o;->d:Z

    .line 7
    :goto_2a
    invoke-virtual {p0}, Lb/l/d/o;->d()I

    move-result v4

    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v5, v5, Landroidx/fragment/app/Fragment;->h:I

    if-eq v4, v5, :cond_116

    .line 8
    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v5, v5, Landroidx/fragment/app/Fragment;->h:I

    if-le v4, v5, :cond_93

    .line 9
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v4, v4, Landroidx/fragment/app/Fragment;->h:I

    add-int/2addr v4, v3

    packed-switch v4, :pswitch_data_16a

    goto :goto_2a

    .line 10
    :pswitch_43
    invoke-virtual {p0}, Lb/l/d/o;->n()V

    goto :goto_2a

    .line 11
    :pswitch_47
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v5, 0x6

    iput v5, v4, Landroidx/fragment/app/Fragment;->h:I

    goto :goto_2a

    .line 12
    :pswitch_4d
    invoke-virtual {p0}, Lb/l/d/o;->r()V

    goto :goto_2a

    .line 13
    :pswitch_51
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v4, v4, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v4, :cond_7a

    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v4, v4, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v4, :cond_7a

    .line 14
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v4, v4, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    .line 15
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->A()Landroidx/fragment/app/FragmentManager;

    move-result-object v5

    .line 16
    invoke-static {v4, v5}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;

    move-result-object v4

    .line 17
    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v5, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    .line 18
    invoke-static {v5}, Lb/l/d/w$e$c;->from(I)Lb/l/d/w$e$c;

    move-result-object v5

    .line 19
    invoke-virtual {v4, v5, p0}, Lb/l/d/w;->a(Lb/l/d/w$e$c;Lb/l/d/o;)V

    .line 20
    :cond_7a
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v5, 0x4

    iput v5, v4, Landroidx/fragment/app/Fragment;->h:I

    goto :goto_2a

    .line 21
    :pswitch_80
    invoke-virtual {p0}, Lb/l/d/o;->a()V

    goto :goto_2a

    .line 22
    :pswitch_84
    invoke-virtual {p0}, Lb/l/d/o;->j()V

    .line 23
    invoke-virtual {p0}, Lb/l/d/o;->f()V

    goto :goto_2a

    .line 24
    :pswitch_8b
    invoke-virtual {p0}, Lb/l/d/o;->e()V

    goto :goto_2a

    .line 25
    :pswitch_8f
    invoke-virtual {p0}, Lb/l/d/o;->c()V

    goto :goto_2a

    .line 26
    :cond_93
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v4, v4, Landroidx/fragment/app/Fragment;->h:I

    sub-int/2addr v4, v3

    packed-switch v4, :pswitch_data_17e

    goto :goto_2a

    .line 27
    :pswitch_9c
    invoke-virtual {p0}, Lb/l/d/o;->m()V

    goto :goto_2a

    .line 28
    :pswitch_a0
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v5, 0x5

    iput v5, v4, Landroidx/fragment/app/Fragment;->h:I

    goto :goto_2a

    .line 29
    :pswitch_a6
    invoke-virtual {p0}, Lb/l/d/o;->s()V

    goto :goto_2a

    :pswitch_aa
    const/4 v4, 0x3

    .line 30
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v5

    if-eqz v5, :cond_c7

    .line 31
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "movefrom ACTIVITY_CREATED: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    :cond_c7
    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v5, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v5, :cond_d6

    .line 33
    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v5, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    if-nez v5, :cond_d6

    .line 34
    invoke-virtual {p0}, Lb/l/d/o;->q()V

    .line 35
    :cond_d6
    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v5, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v5, :cond_f3

    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v5, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v5, :cond_f3

    .line 36
    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v5, v5, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    iget-object v6, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    .line 37
    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->A()Landroidx/fragment/app/FragmentManager;

    move-result-object v6

    .line 38
    invoke-static {v5, v6}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;

    move-result-object v5

    .line 39
    invoke-virtual {v5, p0}, Lb/l/d/w;->b(Lb/l/d/o;)V

    .line 40
    :cond_f3
    iget-object v5, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput v4, v5, Landroidx/fragment/app/Fragment;->h:I

    goto/16 :goto_2a

    .line 41
    :pswitch_f9
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-boolean v0, v4, Landroidx/fragment/app/Fragment;->v:Z

    .line 42
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput v2, v4, Landroidx/fragment/app/Fragment;->h:I

    goto/16 :goto_2a

    .line 43
    :pswitch_103
    invoke-virtual {p0}, Lb/l/d/o;->h()V

    .line 44
    iget-object v4, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput v3, v4, Landroidx/fragment/app/Fragment;->h:I

    goto/16 :goto_2a

    .line 45
    :pswitch_10c
    invoke-virtual {p0}, Lb/l/d/o;->g()V

    goto/16 :goto_2a

    .line 46
    :pswitch_111
    invoke-virtual {p0}, Lb/l/d/o;->i()V

    goto/16 :goto_2a

    .line 47
    :cond_116
    sget-boolean v1, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v1, :cond_163

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v1, v1, Landroidx/fragment/app/Fragment;->T:Z

    if-eqz v1, :cond_163

    .line 48
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v1, :cond_147

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v1, :cond_147

    .line 49
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    .line 50
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->A()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    .line 51
    invoke-static {v1, v2}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;

    move-result-object v1

    .line 52
    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v2, v2, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz v2, :cond_144

    .line 53
    invoke-virtual {v1, p0}, Lb/l/d/w;->a(Lb/l/d/o;)V

    goto :goto_147

    .line 54
    :cond_144
    invoke-virtual {v1, p0}, Lb/l/d/w;->c(Lb/l/d/o;)V

    .line 55
    :cond_147
    :goto_147
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v1, :cond_156

    .line 56
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->n(Landroidx/fragment/app/Fragment;)V

    .line 57
    :cond_156
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-boolean v0, v1, Landroidx/fragment/app/Fragment;->T:Z

    .line 58
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v2, v2, Landroidx/fragment/app/Fragment;->G:Z

    invoke-virtual {v1, v2}, Landroidx/fragment/app/Fragment;->b(Z)V
    :try_end_163
    .catchall {:try_start_28 .. :try_end_163} :catchall_166

    .line 59
    :cond_163
    iput-boolean v0, p0, Lb/l/d/o;->d:Z

    return-void

    :catchall_166
    move-exception v1

    iput-boolean v0, p0, Lb/l/d/o;->d:Z

    .line 60
    throw v1

    :pswitch_data_16a
    .packed-switch 0x0
        :pswitch_8f
        :pswitch_8b
        :pswitch_84
        :pswitch_80
        :pswitch_51
        :pswitch_4d
        :pswitch_47
        :pswitch_43
    .end packed-switch

    :pswitch_data_17e
    .packed-switch -0x1
        :pswitch_111
        :pswitch_10c
        :pswitch_103
        :pswitch_f9
        :pswitch_aa
        :pswitch_a6
        :pswitch_a0
        :pswitch_9c
    .end packed-switch
.end method

.method public m()V
    .registers 4

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "movefrom RESUMED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->m0()V

    .line 4
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lb/l/d/j;->d(Landroidx/fragment/app/Fragment;Z)V

    return-void
.end method

.method public n()V
    .registers 6

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    const-string v1, "FragmentManager"

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "moveto RESUMED: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->v()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_75

    .line 4
    invoke-virtual {p0, v0}, Lb/l/d/o;->a(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_75

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    move-result v2

    const/4 v3, 0x2

    .line 6
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v3

    if-eqz v3, :cond_75

    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "requestFocus: Restoring focused view "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_4f

    const-string v0, "succeeded"

    goto :goto_51

    :cond_4f
    const-string v0, "failed"

    .line 8
    :goto_51
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " on Fragment "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " resulting in focused view "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 9
    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 10
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    :cond_75
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->c(Landroid/view/View;)V

    .line 12
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->o0()V

    .line 13
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lb/l/d/j;->f(Landroidx/fragment/app/Fragment;Z)V

    .line 14
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object v1, v0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    .line 15
    iput-object v1, v0, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    .line 16
    iput-object v1, v0, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    return-void
.end method

.method public final o()Landroid/os/Bundle;
    .registers 5

    .line 1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1, v0}, Landroidx/fragment/app/Fragment;->j(Landroid/os/Bundle;)V

    .line 3
    iget-object v1, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lb/l/d/j;->d(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;Z)V

    .line 4
    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v0, 0x0

    .line 5
    :cond_19
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v1, :cond_22

    .line 6
    invoke-virtual {p0}, Lb/l/d/o;->q()V

    .line 7
    :cond_22
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    if-eqz v1, :cond_38

    if-nez v0, :cond_2f

    .line 8
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 9
    :cond_2f
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    const-string v2, "android:view_state"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 10
    :cond_38
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    if-eqz v1, :cond_4e

    if-nez v0, :cond_45

    .line 11
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    :cond_45
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    const-string v2, "android:view_registry_state"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 13
    :cond_4e
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v1, v1, Landroidx/fragment/app/Fragment;->Q:Z

    if-nez v1, :cond_64

    if-nez v0, :cond_5b

    .line 14
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 15
    :cond_5b
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-boolean v1, v1, Landroidx/fragment/app/Fragment;->Q:Z

    const-string v2, "android:user_visible_hint"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_64
    return-object v0
.end method

.method public p()Landroidx/fragment/app/FragmentState;
    .registers 5

    .line 1
    new-instance v0, Landroidx/fragment/app/FragmentState;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-direct {v0, v1}, Landroidx/fragment/app/FragmentState;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 2
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v1, v1, Landroidx/fragment/app/Fragment;->h:I

    const/4 v2, -0x1

    if-le v1, v2, :cond_40

    iget-object v1, v0, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    if-nez v1, :cond_40

    .line 3
    invoke-virtual {p0}, Lb/l/d/o;->o()Landroid/os/Bundle;

    move-result-object v1

    iput-object v1, v0, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    .line 4
    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    if-eqz v2, :cond_46

    if-nez v1, :cond_27

    .line 5
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iput-object v1, v0, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    .line 6
    :cond_27
    iget-object v1, v0, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    iget-object v2, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    const-string v3, "android:target_state"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget v1, v1, Landroidx/fragment/app/Fragment;->q:I

    if-eqz v1, :cond_46

    .line 8
    iget-object v2, v0, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    const-string v3, "android:target_req_state"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_46

    .line 9
    :cond_40
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    iput-object v1, v0, Landroidx/fragment/app/FragmentState;->t:Landroid/os/Bundle;

    :cond_46
    :goto_46
    return-object v0
.end method

.method public q()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v0, v0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 3
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 4
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-lez v1, :cond_1d

    .line 5
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object v0, v1, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    .line 6
    :cond_1d
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 7
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iget-object v1, v1, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-virtual {v1, v0}, Lb/l/d/u;->b(Landroid/os/Bundle;)V

    .line 8
    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_33

    .line 9
    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    iput-object v0, v1, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    :cond_33
    return-void
.end method

.method public r()V
    .registers 4

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveto STARTED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->p0()V

    .line 4
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lb/l/d/j;->g(Landroidx/fragment/app/Fragment;Z)V

    return-void
.end method

.method public s()V
    .registers 4

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "movefrom STARTED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1f
    iget-object v0, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->q0()V

    .line 4
    iget-object v0, p0, Lb/l/d/o;->a:Lb/l/d/j;

    iget-object v1, p0, Lb/l/d/o;->c:Landroidx/fragment/app/Fragment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lb/l/d/j;->h(Landroidx/fragment/app/Fragment;Z)V

    return-void
.end method
