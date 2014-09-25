.class public final enum Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;
.super Ljava/lang/Enum;
.source "ResolveMerger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/merge/ResolveMerger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MergeFailureReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

.field public static final enum COULD_NOT_DELETE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

.field public static final enum DIRTY_INDEX:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

.field public static final enum DIRTY_WORKTREE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 103
    new-instance v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    const-string v1, "DIRTY_INDEX"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->DIRTY_INDEX:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    .line 105
    new-instance v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    const-string v1, "DIRTY_WORKTREE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->DIRTY_WORKTREE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    .line 107
    new-instance v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    const-string v1, "COULD_NOT_DELETE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->COULD_NOT_DELETE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    .line 101
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    sget-object v1, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->DIRTY_INDEX:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->DIRTY_WORKTREE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->COULD_NOT_DELETE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->$VALUES:[Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;
    .locals 1
    .parameter "name"

    .prologue
    .line 101
    const-class v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;
    .locals 1

    .prologue
    .line 101
    sget-object v0, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->$VALUES:[Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    return-object v0
.end method
