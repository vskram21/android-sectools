.class public Lorg/eclipse/jgit/lib/NullProgressMonitor;
.super Ljava/lang/Object;
.source "NullProgressMonitor.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/ProgressMonitor;


# static fields
.field public static final INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/NullProgressMonitor;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method


# virtual methods
.method public beginTask(Ljava/lang/String;I)V
    .locals 0
    .parameter "title"
    .parameter "totalWork"

    .prologue
    .line 65
    return-void
.end method

.method public endTask()V
    .locals 0

    .prologue
    .line 77
    return-void
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    return v0
.end method

.method public start(I)V
    .locals 0
    .parameter "totalTasks"

    .prologue
    .line 61
    return-void
.end method

.method public update(I)V
    .locals 0
    .parameter "completed"

    .prologue
    .line 69
    return-void
.end method
