.class final Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;
.super Ljava/lang/Object;
.source "GroupHead.java"

# interfaces
.implements Lorg/eclipse/jgit/fnmatch/GroupHead$CharacterPattern;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/fnmatch/GroupHead;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PunctPattern"
.end annotation


# static fields
.field static final INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;

.field private static punctCharacters:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 220
    new-instance v0, Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;

    invoke-direct {v0}, Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;->INSTANCE:Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;

    .line 222
    const-string v0, "-!\"#$%&\'()*+,./:;<=>?@[\\]_`{|}~"

    sput-object v0, Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;->punctCharacters:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(C)Z
    .locals 2
    .parameter "c"

    .prologue
    .line 225
    sget-object v0, Lorg/eclipse/jgit/fnmatch/GroupHead$PunctPattern;->punctCharacters:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
