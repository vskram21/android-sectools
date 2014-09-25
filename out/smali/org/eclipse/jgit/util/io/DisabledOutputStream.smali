.class public final Lorg/eclipse/jgit/util/io/DisabledOutputStream;
.super Ljava/io/OutputStream;
.source "DisabledOutputStream.java"


# static fields
.field public static final INSTANCE:Lorg/eclipse/jgit/util/io/DisabledOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    new-instance v0, Lorg/eclipse/jgit/util/io/DisabledOutputStream;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/io/DisabledOutputStream;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/io/DisabledOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/DisabledOutputStream;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 59
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 2
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->writingNotPermitted:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
