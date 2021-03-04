"""empty message

Revision ID: 09a160e03002
Revises: 
Create Date: 2021-03-04 11:01:16.018773

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '09a160e03002'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('Artist', 'genres',
               existing_type=sa.VARCHAR(length=2000),
               nullable=False)
    op.alter_column('Venue', 'genres',
               existing_type=sa.VARCHAR(length=2000),
               nullable=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('Venue', 'genres',
               existing_type=sa.VARCHAR(length=2000),
               nullable=True)
    op.alter_column('Artist', 'genres',
               existing_type=sa.VARCHAR(length=2000),
               nullable=True)
    # ### end Alembic commands ###